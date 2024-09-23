@implementation _UIFeedbackGeneratorGestureRecognizerCompletedTouch

+ (id)completedTouchFromTouch:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  *((_QWORD *)v5 + 2) = objc_msgSend(v4, "type");
  *((_BYTE *)v5 + 8) = objc_msgSend(v4, "_isPointerTouch");
  *((_QWORD *)v5 + 4) = objc_msgSend(v4, "_pointerSenderID");
  *((_QWORD *)v5 + 3) = objc_msgSend(v4, "_senderID");
  objc_msgSend(v4, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)v5 + 5, v6);

  v7 = -[UITouch _locationInWindow:]((double *)v4, 0);
  v9 = v8;

  *((double *)v5 + 6) = v7;
  *((_QWORD *)v5 + 7) = v9;
  return v5;
}

- (CGPoint)locationInView:(id)a3
{
  UIWindow **p_window;
  id v5;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  p_window = &self->_window;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_window);
  objc_msgSend(v5, "convertPoint:fromView:", WeakRetained, self->_locationInWindow.x, self->_locationInWindow.y);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)_senderID
{
  return self->_senderID;
}

- (BOOL)_isPointerTouch
{
  return self->_pointerTouch;
}

- (unint64_t)_pointerSenderID
{
  return self->_pointerSenderID;
}

- (CGPoint)locationInWindow
{
  double x;
  double y;
  CGPoint result;

  x = self->_locationInWindow.x;
  y = self->_locationInWindow.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLocationInWindow:(CGPoint)a3
{
  self->_locationInWindow = a3;
}

- (UIWindow)window
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_window);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_window);
}

@end

@implementation _UIFocusEnginePanGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UIFocusEnginePanGestureRecognizer;
  v6 = a4;
  -[UIPanGestureRecognizer touchesBegan:withEvent:](&v16, sel_touchesBegan_withEvent_, a3, v6);
  -[UIGestureRecognizer delegate](self, "delegate", v16.receiver, v16.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[UIGestureRecognizer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "focusEnginePanGestureRecognizerShouldRecognizeImmediately:", self);

    if (v10)
      -[UIGestureRecognizer setState:](self, "setState:", 1);
  }
  -[_UIFocusEnginePanGestureRecognizer touchObserver](self, "touchObserver");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_digitizerLocation");
  v13 = v12;
  v15 = v14;

  objc_msgSend(v11, "focusEnginePanGesture:touchBeganAtDigitizerLocation:", self, v13, v15);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIFocusEnginePanGestureRecognizer;
  v6 = a4;
  -[UIPanGestureRecognizer touchesMoved:withEvent:](&v12, sel_touchesMoved_withEvent_, a3, v6);
  -[_UIFocusEnginePanGestureRecognizer touchObserver](self, "touchObserver", v12.receiver, v12.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_digitizerLocation");
  v9 = v8;
  v11 = v10;

  objc_msgSend(v7, "focusEnginePanGesture:touchMovedToDigitizerLocation:", self, v9, v11);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIFocusEnginePanGestureRecognizer;
  v6 = a4;
  -[UIPanGestureRecognizer touchesEnded:withEvent:](&v12, sel_touchesEnded_withEvent_, a3, v6);
  -[_UIFocusEnginePanGestureRecognizer touchObserver](self, "touchObserver", v12.receiver, v12.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_digitizerLocation");
  v9 = v8;
  v11 = v10;

  objc_msgSend(v7, "focusEnginePanGesture:touchEndedAtDigitizerLocation:", self, v9, v11);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIFocusEnginePanGestureRecognizer;
  v6 = a4;
  -[UIPanGestureRecognizer touchesCancelled:withEvent:](&v12, sel_touchesCancelled_withEvent_, a3, v6);
  -[_UIFocusEnginePanGestureRecognizer touchObserver](self, "touchObserver", v12.receiver, v12.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_digitizerLocation");
  v9 = v8;
  v11 = v10;

  objc_msgSend(v7, "focusEnginePanGesture:touchCancelledAtDigitizerLocation:", self, v9, v11);
}

- (_UIFocusEnginePanGestureTouchObserver)touchObserver
{
  return (_UIFocusEnginePanGestureTouchObserver *)objc_loadWeakRetained((id *)&self->_touchObserver);
}

- (void)setTouchObserver:(id)a3
{
  objc_storeWeak((id *)&self->_touchObserver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_touchObserver);
}

@end

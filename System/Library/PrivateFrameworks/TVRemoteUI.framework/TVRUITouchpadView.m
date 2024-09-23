@implementation TVRUITouchpadView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  objc_super v15;
  objc_super v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[TVRUITouchpadView touchDelegate](self, "touchDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[TVRUITouchpadView touchDelegate](self, "touchDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hitTest:withEvent:forTouchpadView:", v7, self, x, y);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = v11;
    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)TVRUITouchpadView;
      -[TVRUITouchpadView hitTest:withEvent:](&v16, sel_hitTest_withEvent_, v7, x, y);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)TVRUITouchpadView;
    -[TVRUITouchpadView hitTest:withEvent:](&v15, sel_hitTest_withEvent_, v7, x, y);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (TVRUITouchpadDelegate)touchDelegate
{
  return (TVRUITouchpadDelegate *)objc_loadWeakRetained((id *)&self->_touchDelegate);
}

- (void)setTouchDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_touchDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_touchDelegate);
}

@end

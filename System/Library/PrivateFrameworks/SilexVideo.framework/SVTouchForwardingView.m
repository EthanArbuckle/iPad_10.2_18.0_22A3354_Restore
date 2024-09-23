@implementation SVTouchForwardingView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  SVTouchForwardingView *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void (**v15)(void);
  objc_super v17;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SVTouchForwardingView;
  -[SVTouchForwardingView hitTest:withEvent:](&v17, sel_hitTest_withEvent_, v7, x, y);
  v8 = (SVTouchForwardingView *)objc_claimAutoreleasedReturnValue();
  if (v7 && !objc_msgSend(v7, "type") && v8 == self)
  {
    -[SVTouchForwardingView touchedBlock](self, "touchedBlock");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[SVTouchForwardingView lastTouchTimestamp](self, "lastTouchTimestamp");
      v12 = v11;
      objc_msgSend(v7, "timestamp");
      v14 = v13;

      if (v12 != v14)
      {
        -[SVTouchForwardingView touchedBlock](self, "touchedBlock");
        v15 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v15[2]();

        objc_msgSend(v7, "timestamp");
        -[SVTouchForwardingView setLastTouchTimestamp:](self, "setLastTouchTimestamp:");
      }
    }

    v8 = 0;
  }

  return v8;
}

- (id)touchedBlock
{
  return self->_touchedBlock;
}

- (void)onTouch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (double)lastTouchTimestamp
{
  return self->_lastTouchTimestamp;
}

- (void)setLastTouchTimestamp:(double)a3
{
  self->_lastTouchTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_touchedBlock, 0);
}

@end

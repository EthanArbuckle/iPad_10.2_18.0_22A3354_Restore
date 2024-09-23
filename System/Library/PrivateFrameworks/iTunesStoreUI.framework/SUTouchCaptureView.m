@implementation SUTouchCaptureView

- (void)dealloc
{
  objc_super v3;

  self->_passThroughViews = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUTouchCaptureView;
  -[SUTouchCaptureView dealloc](&v3, sel_dealloc);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  SUTouchCaptureView *v8;
  NSArray *passThroughViews;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  y = a3.y;
  x = a3.x;
  v23 = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)SUTouchCaptureView;
  v8 = -[SUTouchCaptureView hitTest:withEvent:](&v21, sel_hitTest_withEvent_);
  if (v8 == self)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    passThroughViews = self->_passThroughViews;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](passThroughViews, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(passThroughViews);
          v8 = *(SUTouchCaptureView **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v15 = (void *)-[SUTouchCaptureView superview](v8, "superview");
          if (v15)
          {
            v16 = v15;
            objc_msgSend(v15, "convertPoint:fromView:", self, x, y);
            if (v8 == (SUTouchCaptureView *)objc_msgSend(v16, "hitTest:withEvent:", a4) && v8)
              return v8;
          }
          else
          {
            -[SUTouchCaptureView convertPoint:fromView:](v8, "convertPoint:fromView:", self, x, y);
            v8 = -[SUTouchCaptureView hitTest:withEvent:](v8, "hitTest:withEvent:", a4);
            if (v8)
              return v8;
          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](passThroughViews, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v12);
    }
    return self;
  }
  return v8;
}

- (NSArray)passThroughViews
{
  return self->_passThroughViews;
}

- (void)setPassThroughViews:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 464);
}

@end

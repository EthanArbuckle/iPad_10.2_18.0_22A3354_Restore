@implementation SBHStackConfigurationView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBHStackConfigurationView;
  -[SBHStackConfigurationView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "stackConfigurationView:didHitTestView:atPoint:withEvent:", self, v8, v7, x, y);

  return v8;
}

- (SBHStackConfigurationViewHitTestDelegate)delegate
{
  return (SBHStackConfigurationViewHitTestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end

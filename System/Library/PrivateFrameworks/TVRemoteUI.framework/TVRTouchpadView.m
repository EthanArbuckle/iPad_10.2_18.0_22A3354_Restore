@implementation TVRTouchpadView

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRTouchpadView;
  result = -[TVRTouchpadView initWithFrame:](&v3, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (result)
    *((_BYTE *)result + 416) = 0;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;

  v6 = a4;
  v7 = a3;
  -[TVRTouchpadView _notifyConfigurationHandler:](self, "_notifyConfigurationHandler:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_touchProcessor);
  objc_msgSend(WeakRetained, "touchesBegan:withEvent:", v7, v6);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  TVRTouchProcessor **p_touchProcessor;
  id v6;
  id v7;
  id WeakRetained;

  p_touchProcessor = &self->_touchProcessor;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_touchProcessor);
  objc_msgSend(WeakRetained, "touchesMoved:withEvent:", v7, v6);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;

  v6 = a4;
  v7 = a3;
  -[TVRTouchpadView _notifyConfigurationHandler:](self, "_notifyConfigurationHandler:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_touchProcessor);
  objc_msgSend(WeakRetained, "touchesEnded:withEvent:", v7, v6);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;

  v6 = a4;
  v7 = a3;
  -[TVRTouchpadView _notifyConfigurationHandler:](self, "_notifyConfigurationHandler:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_touchProcessor);
  objc_msgSend(WeakRetained, "touchesCancelled:withEvent:", v7, v6);

}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    -[TVRTouchpadView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_notifyConfigurationHandler:(BOOL)a3
{
  void (**configurationHandler)(id, BOOL);

  self->_highlighted = a3;
  configurationHandler = (void (**)(id, BOOL))self->_configurationHandler;
  if (configurationHandler)
    configurationHandler[2](configurationHandler, a3);
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (id)configurationHandler
{
  return self->_configurationHandler;
}

- (void)setConfigurationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (TVRTouchProcessor)touchProcessor
{
  return (TVRTouchProcessor *)objc_loadWeakRetained((id *)&self->_touchProcessor);
}

- (void)setTouchProcessor:(id)a3
{
  objc_storeWeak((id *)&self->_touchProcessor, a3);
}

- (TVRButtonHaptic)haptic
{
  return self->_haptic;
}

- (void)setHaptic:(id)a3
{
  objc_storeStrong((id *)&self->_haptic, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_haptic, 0);
  objc_destroyWeak((id *)&self->_touchProcessor);
  objc_storeStrong(&self->_configurationHandler, 0);
}

@end

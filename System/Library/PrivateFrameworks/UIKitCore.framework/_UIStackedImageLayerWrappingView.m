@implementation _UIStackedImageLayerWrappingView

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_actionDelegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)_UIStackedImageLayerWrappingView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  CALayerDelegate **p_actionDelegate;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  p_actionDelegate = &self->_actionDelegate;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_actionDelegate);
  objc_msgSend(WeakRetained, "actionForLayer:forKey:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CALayerDelegate)actionDelegate
{
  return (CALayerDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionDelegate);
}

@end

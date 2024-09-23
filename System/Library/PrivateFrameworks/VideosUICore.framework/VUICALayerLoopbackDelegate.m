@implementation VUICALayerLoopbackDelegate

- (id)init:(id)a3
{
  id v4;
  VUICALayerLoopbackDelegate *v5;
  VUICALayerLoopbackDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VUICALayerLoopbackDelegate;
  v5 = -[VUICALayerLoopbackDelegate init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_view, v4);

  return v6;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  UIView **p_view;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  p_view = &self->_view;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(WeakRetained, "actionForLayer:forKey:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
}

@end

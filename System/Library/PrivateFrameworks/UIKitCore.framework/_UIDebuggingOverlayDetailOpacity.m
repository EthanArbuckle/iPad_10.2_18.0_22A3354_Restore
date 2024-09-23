@implementation _UIDebuggingOverlayDetailOpacity

- (id)view
{
  return self->_view;
}

- (void)_updateForInspectedView:(id)a3
{
  UIView **p_inspectedView;
  id v5;
  void *v6;
  int v7;
  int v8;
  UISlider *v9;
  double v10;
  double v11;
  double v12;
  UIView *view;

  p_inspectedView = &self->_inspectedView;
  v5 = a3;
  objc_storeWeak((id *)p_inspectedView, v5);
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "opacity");
  v8 = v7;

  v9 = objc_alloc_init(UISlider);
  LODWORD(v10) = 0;
  -[UISlider setMinimumValue:](v9, "setMinimumValue:", v10);
  LODWORD(v11) = 1.0;
  -[UISlider setMaximumValue:](v9, "setMaximumValue:", v11);
  LODWORD(v12) = v8;
  -[UISlider setValue:](v9, "setValue:", v12);
  -[UIControl addTarget:action:forControlEvents:](v9, "addTarget:action:forControlEvents:", self, sel__sliderValueChanged_, 4096);
  view = self->_view;
  self->_view = &v9->super.super;

}

- (void)_sliderValueChanged:(id)a3
{
  int v4;
  int v5;
  void *v6;
  double v7;
  id WeakRetained;

  objc_msgSend(a3, "value");
  v5 = v4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inspectedView);
  objc_msgSend(WeakRetained, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = v5;
  objc_msgSend(v6, "setOpacity:", v7);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inspectedView);
  objc_storeStrong((id *)&self->_view, 0);
}

@end

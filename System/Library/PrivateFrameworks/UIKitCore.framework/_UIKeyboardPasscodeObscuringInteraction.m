@implementation _UIKeyboardPasscodeObscuringInteraction

- (UIPointerInteraction)pointerInteraction
{
  UIPointerInteraction *pointerInteraction;
  UIPointerInteraction *v4;
  UIPointerInteraction *v5;

  pointerInteraction = self->_pointerInteraction;
  if (!pointerInteraction)
  {
    v4 = -[UIPointerInteraction initWithDelegate:]([UIPointerInteraction alloc], "initWithDelegate:", self);
    v5 = self->_pointerInteraction;
    self->_pointerInteraction = v4;

    pointerInteraction = self->_pointerInteraction;
  }
  return pointerInteraction;
}

- (void)willMoveToView:(id)a3
{
  UIView **p_view;
  id WeakRetained;
  void *v6;
  id v7;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisableUpdateMask:", 0);

  if (self->_pointerInteraction)
  {
    v7 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v7, "removeInteraction:", self->_pointerInteraction);

  }
  objc_storeWeak((id *)p_view, 0);
}

- (void)didMoveToView:(id)a3
{
  UIView **p_view;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;

  p_view = &self->_view;
  v5 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(WeakRetained, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisableUpdateMask:", 18);

    v8 = objc_loadWeakRetained((id *)p_view);
    -[_UIKeyboardPasscodeObscuringInteraction pointerInteraction](self, "pointerInteraction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addInteraction:", v9);

  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;

  v6 = a5;
  objc_msgSend(a3, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v6, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v16, v9, v11, v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v4;

  +[UIPointerStyle systemPointerStyle](UIPointerStyle, "systemPointerStyle", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_suppressesMirroring:", 1);
  return v4;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (void)setPointerInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pointerInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end

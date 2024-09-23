@implementation _UIAssistantEntry

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  UIPointerInteractionDelegate **p_view;
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  id *v14;
  void *v16;

  p_view = &self->_view;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(WeakRetained, "pointerInteraction:regionForRequest:defaultRegion:", v12, v11, v10);
  v14 = (id *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPointerInteractionAssistant.m"), 113, CFSTR("Assisted views must call -createRegionFromRect:targetView:identifier:selected: to create regions"));

    }
    objc_storeStrong(v14 + 11, self);
  }
  return v14;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  UIPointerInteractionDelegate **p_view;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  p_view = &self->_view;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(WeakRetained, "pointerInteraction:styleForRegion:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  UIPointerInteractionDelegate **p_view;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  p_view = &self->_view;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(WeakRetained, "pointerInteraction:willEnterRegion:animator:", v10, v9, v8);

}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  UIPointerInteractionDelegate **p_view;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  p_view = &self->_view;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(WeakRetained, "pointerInteraction:willExitRegion:animator:", v10, v9, v8);

}

@end

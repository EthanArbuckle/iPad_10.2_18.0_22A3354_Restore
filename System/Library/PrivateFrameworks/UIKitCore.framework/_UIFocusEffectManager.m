@implementation _UIFocusEffectManager

- (void)moveFocusToItem:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;

  v20 = a3;
  if (!v20)
    goto LABEL_12;
  _UIFocusEnvironmentContainingView(v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_window");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {

    goto LABEL_12;
  }
  v7 = (void *)v6;
  _UIFocusItemHaloEffect(v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_12:
    -[_UIFocusEffectManager _observeFocusedItemGeometryForItem:](self, "_observeFocusedItemGeometryForItem:", 0, v20);
    -[_UIFocusEffectManager haloView](self, "haloView");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeFromSuperview");
    goto LABEL_13;
  }
  objc_msgSend(v8, "_shape");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusEffectManager.m"), 40, CFSTR("Expected a nonnull shape for a resolved focus effect."));

  }
  objc_msgSend(v8, "containerView", v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusEffectManager.m"), 43, CFSTR("Expected a nonnull container view for a resolved focus effect."));

  }
  objc_msgSend(v8, "_shapeCoordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusEffectManager.m"), 46, CFSTR("Expected a nonnull shape coordinate space for a resolved focus effect."));

  }
  objc_msgSend(v9, "shapeConvertedFromCoordinateSpace:toCoordinateSpace:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __41___UIFocusEffectManager_moveFocusToItem___block_invoke;
  v22[3] = &unk_1E16B6F18;
  v22[4] = self;
  v23 = v8;
  v13 = v21;
  v24 = v13;
  v25 = v10;
  v26 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v8;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v22);
  -[_UIFocusEffectManager _observeFocusedItemGeometryForItem:](self, "_observeFocusedItemGeometryForItem:", v13);

LABEL_13:
}

- (void)_observeFocusedItemGeometryForItem:(id)a3
{
  _QWORD *WeakRetained;
  void *v5;
  id v6;
  int IsKindOfUIView;
  _QWORD *v8;
  int v9;
  _QWORD *obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->_focusedItem);
    IsKindOfUIView = _IsKindOfUIView((uint64_t)v6);

    if (IsKindOfUIView)
    {
      v8 = objc_loadWeakRetained((id *)&self->_focusedItem);
      -[UIView _removeGeometryChangeObserver:](v8, self);

    }
    objc_storeWeak((id *)&self->_focusedItem, obj);
    v9 = _IsKindOfUIView((uint64_t)obj);
    v5 = obj;
    if (v9)
    {
      -[UIView _addGeometryChangeObserver:](obj, self);
      v5 = obj;
    }
  }

}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  id v5;

  -[_UIFocusEffectManager focusedItem](self, "focusedItem", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIFocusEffectManager moveFocusToItem:](self, "moveFocusToItem:", v5);

}

- (_UIFocusHaloView)haloView
{
  _UIFocusHaloView *haloView;
  _UIFocusHaloView *v4;
  _UIFocusHaloView *v5;

  haloView = self->_haloView;
  if (!haloView)
  {
    v4 = (_UIFocusHaloView *)objc_opt_new();
    v5 = self->_haloView;
    self->_haloView = v4;

    haloView = self->_haloView;
  }
  return haloView;
}

- (UIFocusItem)focusedItem
{
  return (UIFocusItem *)objc_loadWeakRetained((id *)&self->_focusedItem);
}

- (void)setFocusedItem:(id)a3
{
  objc_storeWeak((id *)&self->_focusedItem, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusedItem);
  objc_storeStrong((id *)&self->_haloView, 0);
}

@end

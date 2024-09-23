@implementation _TUIRenderModelPageControl

- (_TUIRenderModelPageControl)initWithStateToRenderModel:(id)a3 pressScale:(double)a4 touchInsets:(UIEdgeInsets)a5 identifier:(id)a6 pointer:(id)a7 scrollIdentifier:(id)a8 kind:(unint64_t)a9
{
  double right;
  double bottom;
  double left;
  double top;
  id v20;
  _TUIRenderModelPageControl *v21;
  _TUIRenderModelPageControl *v22;
  char v24;
  objc_super v25;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v20 = a8;
  v25.receiver = self;
  v25.super_class = (Class)_TUIRenderModelPageControl;
  v24 = 1;
  v21 = -[TUIRenderModelInteractive initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:](&v25, "initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:", CFSTR("TUIReuseIdentifierPageControlView"), a6, 0, a3, 0, 0, a4, top, left, bottom, right, 0, v24, a7, 0, 0,
          0);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_scrollIdentifier, a8);
    v22->_actionKind = a9;
  }

  return v22;
}

- (id)_copyAppearanceWithFlags:(unint64_t)a3 statesCopyProc:(void *)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v7 = objc_alloc((Class)objc_opt_class(self));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive stateToModel](self, "stateToModel"));
  v9 = ((uint64_t (*)(void *, unint64_t))a4)(v8, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[TUIRenderModelInteractive pressScale](self, "pressScale");
  v12 = v11;
  -[TUIRenderModelInteractive touchInsets](self, "touchInsets");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive identifier](self, "identifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive pointer](self, "pointer"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelPageControl scrollIdentifier](self, "scrollIdentifier"));
  v24 = objc_msgSend(v7, "initWithStateToRenderModel:pressScale:touchInsets:identifier:pointer:scrollIdentifier:kind:", v10, v21, v22, v23, -[_TUIRenderModelPageControl actionKind](self, "actionKind"), v12, v14, v16, v18, v20);

  TUIRenderModelCopyProperties(v24, self);
  return v24;
}

- (TUIIdentifier)scrollIdentifier
{
  return self->_scrollIdentifier;
}

- (unint64_t)actionKind
{
  return self->_actionKind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollIdentifier, 0);
}

@end

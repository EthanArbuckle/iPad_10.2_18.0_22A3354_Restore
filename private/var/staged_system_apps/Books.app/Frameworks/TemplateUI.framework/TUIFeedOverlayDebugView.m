@implementation TUIFeedOverlayDebugView

- (void)setRenderModel:(id)a3
{
  TUIRenderModelCollection *v5;
  TUIRenderModelCollection *v6;

  v5 = (TUIRenderModelCollection *)a3;
  if (self->_renderModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_renderModel, a3);
    -[TUIFeedOverlayDebugView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIFeedOverlayDebugView;
  -[TUIFeedOverlayDebugView layoutSubviews](&v3, "layoutSubviews");
  -[TUIFeedOverlayDebugView _updateDebugButtons](self, "_updateDebugButtons");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v5;
  TUIFeedOverlayDebugView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIFeedOverlayDebugView;
  v5 = -[TUIFeedOverlayDebugView hitTest:withEvent:](&v8, "hitTest:withEvent:", a4, a3.x, a3.y);
  v6 = (TUIFeedOverlayDebugView *)objc_claimAutoreleasedReturnValue(v5);
  if (v6 == self)
  {

    v6 = 0;
  }
  return v6;
}

- (void)_updateDebugButtons
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[5];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_15A940;
  v13[3] = &unk_23D938;
  v13[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIFeedSectionDebug button](self->_debug, "button"));
  objc_msgSend(v3, "setHidden:", -[_TUIFeedSectionDebug showButton](self->_debug, "showButton") ^ 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "feedOverlayDebugViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v6, "safeAreaInsets");
  v8 = v7;
  v10 = v9;

  objc_msgSend(v3, "bounds");
  v12 = v11;
  objc_msgSend(v3, "bounds");
  objc_msgSend(v3, "setFrame:", v10 + 5.0, v8 + 5.0, v12);

}

- (TUIFeedOverlayDebugViewDelegate)delegate
{
  return (TUIFeedOverlayDebugViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TUIRenderModelCollection)renderModel
{
  return self->_renderModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_debug, 0);
}

@end

@implementation _UINavigationBarTitleRenameRemoteView

- (_UINavigationBarTitleRenameRemoteView)initWithSession:(id)a3
{
  id v6;
  _UINavigationBarTitleRenameRemoteView *v7;
  _UINavigationBarTitleRenameRemoteView *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarTitleRenameRemoteView.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[session isKindOfClass:[_UINavigationBarTitleRenamerRemoteSession class]]"));

  }
  v11.receiver = self;
  v11.super_class = (Class)_UINavigationBarTitleRenameRemoteView;
  v7 = -[UIView init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_session, a3);
    v8->_textAlignment = 4;
  }

  return v8;
}

- (void)willMoveToWindow:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UIView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    if (!v4)
    {
      -[_UINavigationBarTitleRenameRemoteView _connect](self, "_connect");
LABEL_6:
      v5 = v6;
    }
  }
  else if (v4)
  {
    -[_UINavigationBarTitleRenameRemoteView _disconnect](self, "_disconnect");
    goto LABEL_6;
  }

}

- (void)setPortalView:(id)a3
{
  _UIPortalView *v5;
  _UIPortalView *portalView;
  _UIPortalView *v7;

  v5 = (_UIPortalView *)a3;
  portalView = self->_portalView;
  v7 = v5;
  if (portalView != v5)
  {
    -[UIView removeFromSuperview](portalView, "removeFromSuperview");
    -[UIView bounds](self, "bounds");
    -[_UIPortalView setFrame:](v7, "setFrame:");
    -[UIView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
    -[UIView addSubview:](self, "addSubview:", v7);
    objc_storeStrong((id *)&self->_portalView, a3);
  }

}

- (void)setIntrinsicContentSize:(CGSize)a3
{
  if (a3.width != self->_intrinsicContentSize.width || a3.height != self->_intrinsicContentSize.height)
  {
    self->_intrinsicContentSize = a3;
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (CGSize)intrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_intrinsicContentSize.width;
  height = self->_intrinsicContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setNeedsMetricsUpdate
{
  void *v3;

  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    -[_UINavigationBarTitleRenameRemoteView portalView](self, "portalView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      *(_BYTE *)&self->_flags |= 1u;
      -[_UINavigationBarTitleRenameRemoteView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_updateMetricsIfNeeded, 0, 0.0);
    }
  }
}

- (void)updateMetricsIfNeeded
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    -[_UINavigationBarTitleRenameRemoteView updateMetrics](self, "updateMetrics");
}

- (void)updateMetrics
{
  _UIONavigationBarTitleRenamerViewMetricsUpdateAction *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int64_t v12;
  void *v13;
  _UIONavigationBarTitleRenamerViewMetricsUpdateAction *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id location;

  *(_BYTE *)&self->_flags &= ~1u;
  objc_msgSend(MEMORY[0x1E0CB3978], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, 0);
  objc_initWeak(&location, self);
  v3 = [_UIONavigationBarTitleRenamerViewMetricsUpdateAction alloc];
  -[UIView frame](self, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = -[_UINavigationBarTitleRenameRemoteView textAlignment](self, "textAlignment");
  -[_UINavigationBarTitleRenameRemoteView session](self, "session");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __54___UINavigationBarTitleRenameRemoteView_updateMetrics__block_invoke;
  v20 = &unk_1E16C1480;
  objc_copyWeak(&v21, &location);
  v14 = -[_UIONavigationBarTitleRenamerViewMetricsUpdateAction initWithFrame:textAlignment:session:responseHandler:](v3, "initWithFrame:textAlignment:session:responseHandler:", v12, v13, &v17, v5, v7, v9, v11);

  -[_UINavigationBarTitleRenameRemoteView session](self, "session", v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "overlayService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendOverlayAction:", v14);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UINavigationBarTitleRenameRemoteView;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UINavigationBarTitleRenameRemoteView setNeedsMetricsUpdate](self, "setNeedsMetricsUpdate");
}

- (void)setCenter:(CGPoint)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UINavigationBarTitleRenameRemoteView;
  -[UIView setCenter:](&v4, sel_setCenter_, a3.x, a3.y);
  -[_UINavigationBarTitleRenameRemoteView setNeedsMetricsUpdate](self, "setNeedsMetricsUpdate");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UINavigationBarTitleRenameRemoteView;
  -[UIView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UINavigationBarTitleRenameRemoteView setNeedsMetricsUpdate](self, "setNeedsMetricsUpdate");
}

- (void)_connect
{
  void *v4;
  _UIPortalView *v5;
  void *v6;
  _UIPortalView *v7;

  -[_UINavigationBarTitleRenameRemoteView portalView](self, "portalView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarTitleRenameRemoteView.m"), 155, CFSTR("Remote view is already connected."));

  }
  v5 = [_UIPortalView alloc];
  -[UIView bounds](self, "bounds");
  v7 = -[_UIPortalView initWithFrame:](v5, "initWithFrame:");
  -[_UIPortalView setName:](v7, "setName:", CFSTR("_UINavigationBarTitleRenameRemoteView.textfield"));
  -[UIView setAutoresizingMask:](v7, "setAutoresizingMask:", 0);
  -[_UIPortalView setHidesSourceView:](v7, "setHidesSourceView:", 1);
  -[_UIPortalView setAllowsHitTesting:](v7, "setAllowsHitTesting:", 1);
  -[_UIPortalView _setAllowedInContextTransform:](v7, "_setAllowedInContextTransform:", 1);
  -[_UINavigationBarTitleRenameRemoteView setPortalView:](self, "setPortalView:", v7);
  -[_UINavigationBarTitleRenameRemoteView updateMetrics](self, "updateMetrics");

}

- (void)_disconnect
{
  void *v3;
  void *v4;

  -[_UINavigationBarTitleRenameRemoteView session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelSession");

  -[_UINavigationBarTitleRenameRemoteView portalView](self, "portalView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[_UINavigationBarTitleRenameRemoteView setPortalView:](self, "setPortalView:", 0);
}

- (void)setHorizontalTextInset:(double)a3
{
  void (**horizontalTextInsetDidChangeCallback)(void);

  if (self->_horizontalTextInset != a3)
  {
    self->_horizontalTextInset = a3;
    horizontalTextInsetDidChangeCallback = (void (**)(void))self->_horizontalTextInsetDidChangeCallback;
    if (horizontalTextInsetDidChangeCallback)
      horizontalTextInsetDidChangeCallback[2]();
  }
}

- (double)horizontalTextInset
{
  return self->_horizontalTextInset;
}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    -[_UINavigationBarTitleRenameRemoteView setNeedsMetricsUpdate](self, "setNeedsMetricsUpdate");
  }
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (id)horizontalTextInsetDidChangeCallback
{
  return self->_horizontalTextInsetDidChangeCallback;
}

- (void)setHorizontalTextInsetDidChangeCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (_UINavigationBarTitleRenamerRemoteSession)session
{
  return self->_session;
}

- (_UIPortalView)portalView
{
  return self->_portalView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_horizontalTextInsetDidChangeCallback, 0);
}

@end

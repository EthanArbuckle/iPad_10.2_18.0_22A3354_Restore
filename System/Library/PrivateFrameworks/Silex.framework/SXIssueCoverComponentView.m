@implementation SXIssueCoverComponentView

- (SXIssueCoverComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 viewProvider:(id)a7
{
  id v13;
  SXIssueCoverComponentView *v14;
  SXIssueCoverComponentView *v15;
  objc_super v17;

  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)SXIssueCoverComponentView;
  v14 = -[SXComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:](&v17, sel_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_, a3, a4, a5, a6);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_viewProvider, a7);

  return v15;
}

- (void)presentComponentWithChanges:(id)a3
{
  BOOL var0;
  void *v5;
  objc_super v6;

  var0 = a3.var0;
  v6.receiver = self;
  v6.super_class = (Class)SXIssueCoverComponentView;
  -[SXComponentView presentComponentWithChanges:](&v6, sel_presentComponentWithChanges_, *(_QWORD *)&a3.var0 & 0xFFFFFFLL);
  if (var0)
  {
    -[SXIssueCoverComponentView coverView](self, "coverView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[SXIssueCoverComponentView renderIssueCover](self, "renderIssueCover");
  }
}

- (void)renderContents
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SXIssueCoverComponentView;
  -[SXComponentView renderContents](&v3, sel_renderContents);
  -[SXIssueCoverComponentView renderIssueCover](self, "renderIssueCover");
}

- (void)discardContents
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXIssueCoverComponentView;
  -[SXComponentView discardContents](&v4, sel_discardContents);
  -[SXIssueCoverComponentView coverView](self, "coverView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[SXIssueCoverComponentView setCoverView:](self, "setCoverView:", 0);
}

- (void)renderIssueCover
{
  SXIssueCover *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SXIssueCoverPresentationOptions *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  SXIssueCoverPresentationOptions *v22;
  void *v23;
  void *v24;
  void *v25;
  SXIssueCover *v26;

  v3 = [SXIssueCover alloc];
  -[SXComponentView component](self, "component");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "issueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[SXIssueCover initWithIssueIdentifier:](v3, "initWithIssueIdentifier:", v5);

  -[SXIssueCoverComponentView coverView](self, "coverView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[SXIssueCoverComponentView viewProvider](self, "viewProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewForIssueCover:", v26);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXIssueCoverComponentView setCoverView:](self, "setCoverView:", v8);

    -[SXIssueCoverComponentView coverView](self, "coverView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessibilityIgnoresInvertColors:", 1);

    -[SXComponentView contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXIssueCoverComponentView coverView](self, "coverView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v11);

  }
  v12 = [SXIssueCoverPresentationOptions alloc];
  -[SXComponentView contentFrame](self, "contentFrame");
  v14 = v13;
  v16 = v15;
  -[SXComponentView component](self, "component");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "videoPlaybackEnabled");
  -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "documentStyle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "backgroundColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[SXIssueCoverPresentationOptions initWithSize:videoPlaybackEnabled:parentBackgroundColor:](v12, "initWithSize:videoPlaybackEnabled:parentBackgroundColor:", v18, v21, v14, v16);

  -[SXIssueCoverComponentView viewProvider](self, "viewProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXIssueCoverComponentView coverView](self, "coverView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "presentIssueCover:onView:options:", v26, v24, v22);

  -[SXIssueCoverComponentView coverView](self, "coverView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView contentFrame](self, "contentFrame");
  objc_msgSend(v25, "setFrame:");

}

- (SXIssueCoverViewProvider)viewProvider
{
  return self->_viewProvider;
}

- (UIView)coverView
{
  return self->_coverView;
}

- (void)setCoverView:(id)a3
{
  objc_storeStrong((id *)&self->_coverView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverView, 0);
  objc_storeStrong((id *)&self->_viewProvider, 0);
}

@end

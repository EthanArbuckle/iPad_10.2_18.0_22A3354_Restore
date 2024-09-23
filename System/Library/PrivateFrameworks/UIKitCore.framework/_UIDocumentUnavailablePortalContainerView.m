@implementation _UIDocumentUnavailablePortalContainerView

- (_QWORD)initWithSourceView:(_QWORD *)a1
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _UIPortalView *v15;
  _UIPortalView *v16;
  void *v17;
  _UIPortalView *v18;
  objc_super v20;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(a2, "bounds");
    v20.receiver = v2;
    v20.super_class = (Class)_UIDocumentUnavailablePortalContainerView;
    v4 = objc_msgSendSuper2(&v20, sel_initWithFrame_);
    v2 = v4;
    if (v4)
    {
      v5 = *MEMORY[0x1E0CD2A68];
      objc_msgSend(v4, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCornerCurve:", v5);

      objc_msgSend(v2, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCornerRadius:", 13.0);

      objc_msgSend(v2, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v9) = 1036831949;
      objc_msgSend(v8, "setShadowOpacity:", v9);

      objc_msgSend(v2, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setShadowRadius:", 40.0);

      objc_msgSend(v2, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setShadowOffset:", 0.0, 8.0);

      +[UIColor blackColor](UIColor, "blackColor");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v13 = objc_msgSend(v12, "CGColor");
      objc_msgSend(v2, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setShadowColor:", v13);

      v15 = [_UIPortalView alloc];
      objc_msgSend(v2, "bounds");
      v16 = -[_UIPortalView initWithFrame:](v15, "initWithFrame:");
      -[UIView setAutoresizingMask:](v16, "setAutoresizingMask:", 18);
      -[_UIPortalView setSourceView:](v16, "setSourceView:", a2);
      -[_UIPortalView setAllowsBackdropGroups:](v16, "setAllowsBackdropGroups:", 1);
      -[_UIPortalView _setPrefersClientLayer:](v16, "_setPrefersClientLayer:", 1);
      v17 = (void *)v2[52];
      v2[52] = v16;
      v18 = v16;

      objc_msgSend(v2, "addSubview:", v18);
    }
  }
  return v2;
}

- (void)layoutSubviews
{
  void *v3;
  _OWORD v4[8];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentUnavailablePortalContainerView;
  -[UIView layoutSubviews](&v5, sel_layoutSubviews);
  -[UIView _intersectedSceneCornerRadii](self, "_intersectedSceneCornerRadii");
  -[UIView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v4[4];
  v4[1] = v4[5];
  v4[2] = v4[6];
  v4[3] = v4[7];
  objc_msgSend(v3, "setCornerRadii:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portalView, 0);
}

@end

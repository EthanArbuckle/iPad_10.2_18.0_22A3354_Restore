@implementation TUIReusableBaseView

- (void)prepareForReuse
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView layer](self, "layer"));
  objc_msgSend(v3, "setFlipsHorizontalAxis:", 0);

  -[TUIReusableBaseView _removeAllAnimations:](self, "_removeAllAnimations:", 1);
}

- (id)descendentViewWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  TUIReusableBaseView *v9;
  TUIReusableBaseView *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView layoutAttributes](self, "layoutAttributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "renderModel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v8 = objc_msgSend(v7, "isEqual:", v4);

  if (v8)
    v9 = self;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

- (id)descendentViewWithRefId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  TUIReusableBaseView *v8;
  TUIReusableBaseView *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView layoutAttributes](self, "layoutAttributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "refId"));
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  if (v7)
    v8 = self;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (BOOL)shouldResetBoundsOriginWhenApplyingLayoutAttributes
{
  return 1;
}

- (id)viewStateSave
{
  return 0;
}

- (id)feedControllerHost
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(TUIFeedView);
  v4 = TUIPlatformAncestorOfClass(self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "controllerHost"));

  return v6;
}

- (id)tui_querySectionUUID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView renderViewHost](self, "renderViewHost"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tui_querySectionUUID"));

  return v3;
}

- (id)tui_querySectionUID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView renderViewHost](self, "renderViewHost"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tui_querySectionUID"));

  return v3;
}

- (TUILayoutAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (void)setLayoutAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_layoutAttributes, a3);
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (void)setReuseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
}

@end

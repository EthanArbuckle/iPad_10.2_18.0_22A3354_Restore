@implementation SKUIContextActionsPresentationSource

- (SKUIContextActionsPresentationSource)initWithViewController:(id)a3
{
  id v5;
  SKUIContextActionsPresentationSource *v6;
  SKUIContextActionsPresentationSource *v7;
  objc_super v9;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIContextActionsPresentationSource initWithViewController:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIContextActionsPresentationSource;
  v6 = -[SKUIContextActionsPresentationSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewController, a3);

  return v7;
}

- (void)presentViewController:(id)a3 permittedArrowDirections:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;

  v5 = a5;
  v35 = a3;
  -[SKUIContextActionsPresentationSource viewController](self, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIContextActionsPresentationSource sourceView](self, "sourceView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = 1;
  }
  else
  {
    -[SKUIContextActionsPresentationSource barButtonItem](self, "barButtonItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11 != 0;

  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "userInterfaceIdiom") == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "keyWindow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "horizontalSizeClass") == 2 && v10;

    if (v16)
      objc_msgSend(v35, "setModalPresentationStyle:", 7);
  }
  else
  {

  }
  objc_msgSend(v8, "presentViewController:animated:completion:", v35, v5, 0);
  objc_msgSend(v35, "popoverPresentationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    v18 = v10;
  else
    v18 = 0;

  if (v18)
  {
    if (objc_msgSend(v35, "conformsToProtocol:", &unk_1EF4292A0))
    {
      objc_msgSend(v35, "presentationController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDelegate:", v35);

    }
    objc_msgSend(v35, "popoverPresentationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPermittedArrowDirections:", a4);

    -[SKUIContextActionsPresentationSource barButtonItem](self, "barButtonItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[SKUIContextActionsPresentationSource barButtonItem](self, "barButtonItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "popoverPresentationController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setBarButtonItem:", v22);

LABEL_21:
      goto LABEL_22;
    }
    -[SKUIContextActionsPresentationSource sourceView](self, "sourceView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[SKUIContextActionsPresentationSource sourceView](self, "sourceView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "popoverPresentationController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setSourceView:", v25);

      -[SKUIContextActionsPresentationSource sourceRect](self, "sourceRect");
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v34 = v33;
      objc_msgSend(v35, "popoverPresentationController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setSourceRect:", v28, v30, v32, v34);
      goto LABEL_21;
    }
  }
LABEL_22:

}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (UIBarButtonItem)barButtonItem
{
  return self->_barButtonItem;
}

- (void)setBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_barButtonItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barButtonItem, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

- (void)initWithViewController:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIContextActionsPresentationSource initWithViewController:]";
}

@end

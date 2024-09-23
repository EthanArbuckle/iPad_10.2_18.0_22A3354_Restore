@implementation SKUINavigationPaletteController

- (SKUINavigationPaletteController)initWithPaletteViewElement:(id)a3
{
  id v5;
  SKUINavigationPaletteController *v6;
  SKUINavigationPaletteController *v7;
  objc_super v9;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUINavigationPaletteController initWithPaletteViewElement:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUINavigationPaletteController;
  v6 = -[SKUINavigationPaletteController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewElement, a3);

  return v7;
}

- (void)reloadSectionViews
{
  void *v3;
  double v4;
  double v5;
  SKUINavigationPaletteView *paletteView;
  SKUIPaletteViewElement *viewElement;
  void *v8;
  objc_super v9;

  -[SKUINavigationBarSectionController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maximumNavigationBarWidth");
  v5 = v4;

  paletteView = self->_paletteView;
  viewElement = self->_viewElement;
  -[SKUINavigationBarSectionController viewLayoutContext](self, "viewLayoutContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUINavigationPaletteView reloadWithViewElement:width:context:](paletteView, "reloadWithViewElement:width:context:", viewElement, v8, (double)(uint64_t)v5);

  v9.receiver = self;
  v9.super_class = (Class)SKUINavigationPaletteController;
  -[SKUINavigationBarSectionController reloadSectionViews](&v9, sel_reloadSectionViews);
}

- (id)view
{
  SKUINavigationPaletteView *paletteView;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SKUIPaletteViewElement *viewElement;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  SKUINavigationPaletteView *v19;
  SKUINavigationPaletteView *v20;
  SKUINavigationPaletteView *v21;
  void *v22;
  SKUINavigationPaletteView *v23;
  SKUIPaletteViewElement *v24;
  void *v25;

  paletteView = self->_paletteView;
  if (!paletteView)
  {
    -[SKUINavigationBarSectionController context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = SKUIUserInterfaceIdiom(v5);

    objc_msgSend(v4, "maximumNavigationBarWidth");
    v8 = v7;
    v9 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    viewElement = self->_viewElement;
    -[SKUINavigationBarSectionController viewLayoutContext](self, "viewLayoutContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKUINavigationPaletteView sizeThatFitsWidth:viewElement:context:](SKUINavigationPaletteView, "sizeThatFitsWidth:viewElement:context:", viewElement, v12, v8);
    v14 = v13;
    v16 = v15;

    v17 = v16 + 14.0;
    if (v16 + 14.0 < 36.0)
      v17 = 36.0;
    if (v6 == 1)
      v18 = v17;
    else
      v18 = v16 + 9.0;
    v19 = -[SKUINavigationPaletteView initWithFrame:]([SKUINavigationPaletteView alloc], "initWithFrame:", v9, v10, v14, v18);
    v20 = self->_paletteView;
    self->_paletteView = v19;

    -[SKUINavigationPaletteView setAutoresizingMask:](self->_paletteView, "setAutoresizingMask:", 2);
    v21 = self->_paletteView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIViewReuseView setBackgroundColor:](v21, "setBackgroundColor:", v22);

    -[SKUINavigationPaletteView setContentInset:](self->_paletteView, "setContentInset:", 0.0, 15.0, 0.0, 15.0);
    if (v6 == 1)
      -[SKUINavigationPaletteView setVerticalAlignment:](self->_paletteView, "setVerticalAlignment:", 1);
    v23 = self->_paletteView;
    v24 = self->_viewElement;
    -[SKUINavigationBarSectionController viewLayoutContext](self, "viewLayoutContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUINavigationPaletteView reloadWithViewElement:width:context:](v23, "reloadWithViewElement:width:context:", v24, v25, v8);

    paletteView = self->_paletteView;
  }
  return paletteView;
}

- (id)viewForElementIdentifier:(id)a3
{
  return -[SKUINavigationPaletteView viewForElementIdentifier:](self->_paletteView, "viewForElementIdentifier:", a3);
}

- (void)willAppearInNavigationBar
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v7;

  -[SKUINavigationBarSectionController viewLayoutContext](self, "viewLayoutContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUINavigationBarSectionController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maximumNavigationBarWidth");
  v6 = v5;

  +[SKUINavigationPaletteView requestLayoutForViewElement:width:context:](SKUINavigationPaletteView, "requestLayoutForViewElement:width:context:", self->_viewElement, v3, (double)(uint64_t)v6);
  +[SKUINavigationPaletteView prefetchResourcesForViewElement:reason:context:](SKUINavigationPaletteView, "prefetchResourcesForViewElement:reason:context:", self->_viewElement, 0, v3);
  v7.receiver = self;
  v7.super_class = (Class)SKUINavigationPaletteController;
  -[SKUINavigationBarSectionController willAppearInNavigationBar](&v7, sel_willAppearInNavigationBar);

}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  SKUINavigationPaletteView *paletteView;
  id v7;
  id v8;
  id v9;

  paletteView = self->_paletteView;
  v7 = a4;
  v8 = a3;
  -[SKUINavigationBarSectionController viewLayoutContext](self, "viewLayoutContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUINavigationPaletteView setImage:forArtworkRequest:context:](paletteView, "setImage:forArtworkRequest:context:", v7, v8, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewLayoutContext, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_paletteView, 0);
  objc_storeStrong((id *)&self->_navigationBarContext, 0);
}

- (void)initWithPaletteViewElement:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUINavigationPaletteController initWithPaletteViewElement:]";
}

@end

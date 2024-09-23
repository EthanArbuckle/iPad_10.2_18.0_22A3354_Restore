@implementation SKUINavigationBarSegmentsController

- (SKUINavigationBarSegmentsController)initWithViewElement:(id)a3
{
  id v4;
  SKUINavigationBarSegmentsController *v5;
  SKUISegmentedControlViewElementController *v6;
  SKUISegmentedControlViewElementController *underlyingController;
  objc_super v9;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUINavigationBarSegmentsController initWithViewElement:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUINavigationBarSegmentsController;
  v5 = -[SKUINavigationBarSegmentsController init](&v9, sel_init);
  if (v5)
  {
    v6 = -[SKUISegmentedControlViewElementController initWithViewElement:]([SKUISegmentedControlViewElementController alloc], "initWithViewElement:", v4);
    underlyingController = v5->_underlyingController;
    v5->_underlyingController = v6;

    -[SKUISegmentedControlViewElementController setDesiredSegmentWidth:](v5->_underlyingController, "setDesiredSegmentWidth:", 0.0);
  }

  return v5;
}

- (void)reloadAfterDocumentUpdateWithNavigationItem:(id)a3
{
  SKUISegmentedControlViewElementController *underlyingController;
  id v5;
  objc_super v6;

  underlyingController = self->_underlyingController;
  v5 = a3;
  -[SKUISegmentedControlViewElementController reloadAfterDocumentUpdate](underlyingController, "reloadAfterDocumentUpdate");
  v6.receiver = self;
  v6.super_class = (Class)SKUINavigationBarSegmentsController;
  -[SKUINavigationBarSectionController reloadAfterDocumentUpdateWithNavigationItem:](&v6, sel_reloadAfterDocumentUpdateWithNavigationItem_, v5);

}

- (id)view
{
  return -[SKUISegmentedControlViewElementController segmentedControlView](self->_underlyingController, "segmentedControlView");
}

- (void)willAppearInNavigationBar
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  objc_super v10;

  -[SKUINavigationBarSectionController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maximumNavigationBarWidth");
  v5 = v4;
  objc_msgSend(v3, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isViewLoaded"))
  {
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v5 = v8;

  }
  if (v5 <= 320.0)
    v9 = 3;
  else
    v9 = 5;
  -[SKUISegmentedControlViewElementController setDefaultMaximumNumberOfVisibleItems:](self->_underlyingController, "setDefaultMaximumNumberOfVisibleItems:", v9);
  v10.receiver = self;
  v10.super_class = (Class)SKUINavigationBarSegmentsController;
  -[SKUINavigationBarSectionController willAppearInNavigationBar](&v10, sel_willAppearInNavigationBar);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingController, 0);
}

- (void)initWithViewElement:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUINavigationBarSegmentsController initWithViewElement:]";
}

@end

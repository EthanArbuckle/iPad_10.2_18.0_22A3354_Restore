@implementation PXPhotosDetailsSpec

- (PXPhotosDetailsSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 detailsOptions:(unint64_t)a5
{
  id v8;
  PXPhotosDetailsSpec *v9;
  PXPhotosDetailsSpec *v10;
  PXWidgetSpec *v11;
  PXWidgetSpec *widgetSpec;
  PXWidgetCompositionSpec *v13;
  PXWidgetCompositionSpec *compositionSpec;
  PXPhotosDetailsBarSpec *v15;
  PXPhotosDetailsBarSpec *barSpec;
  uint64_t v17;
  UIColor *dimmingColor;
  objc_super v20;

  v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PXPhotosDetailsSpec;
  v9 = -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v20, sel_initWithExtendedTraitCollection_options_, v8, a4);
  v10 = v9;
  if (v9)
  {
    v9->_detailsOptions = a5;
    v11 = -[PXWidgetSpec initWithExtendedTraitCollection:options:detailsOptions:]([PXWidgetSpec alloc], "initWithExtendedTraitCollection:options:detailsOptions:", v8, a4, a5);
    widgetSpec = v10->_widgetSpec;
    v10->_widgetSpec = v11;

    v13 = -[PXWidgetCompositionSpec initWithExtendedTraitCollection:widgetSpec:]([PXWidgetCompositionSpec alloc], "initWithExtendedTraitCollection:widgetSpec:", v8, v10->_widgetSpec);
    compositionSpec = v10->_compositionSpec;
    v10->_compositionSpec = v13;

    v15 = -[PXPhotosDetailsBarSpec initWithExtendedTraitCollection:]([PXPhotosDetailsBarSpec alloc], "initWithExtendedTraitCollection:", v8);
    barSpec = v10->_barSpec;
    v10->_barSpec = v15;

    -[PXPhotosDetailsBarSpec setDetailsOptions:](v10->_barSpec, "setDetailsOptions:", a5);
    -[PXPhotosDetailsSpec backgroundColor](v10, "backgroundColor");
    v17 = objc_claimAutoreleasedReturnValue();
    dimmingColor = v10->_dimmingColor;
    v10->_dimmingColor = (UIColor *)v17;

    v10->_dimmingAlpha = 0.75;
  }

  return v10;
}

- (PXPhotosDetailsSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return -[PXPhotosDetailsSpec initWithExtendedTraitCollection:options:detailsOptions:](self, "initWithExtendedTraitCollection:options:detailsOptions:", a3, a4, 0);
}

- (BOOL)shouldInitializeBarsController
{
  return -[PXFeatureSpec userInterfaceIdiom](self, "userInterfaceIdiom") != 3;
}

- (BOOL)enableActionsWidget
{
  return 1;
}

- (UIColor)backgroundColor
{
  void *v3;
  void *v4;
  void *v6;
  uint64_t v7;
  char v8;

  if (-[PXFeatureSpec userInterfaceIdiom](self, "userInterfaceIdiom") == 3
    || -[PXFeatureSpec userInterfaceIdiom](self, "userInterfaceIdiom") == 5)
  {
    v3 = (void *)MEMORY[0x1E0DC3658];
  }
  else
  {
    -[PXPhotosDetailsSpec widgetSpec](self, "widgetSpec");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "sizeClass");

    v8 = -[PXPhotosDetailsSpec detailsOptions](self, "detailsOptions");
    v3 = (void *)MEMORY[0x1E0DC3658];
    if ((v8 & 2) == 0 || v7 != 2)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return (UIColor *)v4;
    }
  }
  objc_msgSend(v3, "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return (UIColor *)v4;
}

- (unint64_t)detailsOptions
{
  return self->_detailsOptions;
}

- (PXWidgetCompositionSpec)compositionSpec
{
  return self->_compositionSpec;
}

- (PXWidgetSpec)widgetSpec
{
  return self->_widgetSpec;
}

- (PXPhotosDetailsBarSpec)barSpec
{
  return self->_barSpec;
}

- (UIColor)dimmingColor
{
  return self->_dimmingColor;
}

- (double)dimmingAlpha
{
  return self->_dimmingAlpha;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingColor, 0);
  objc_storeStrong((id *)&self->_barSpec, 0);
  objc_storeStrong((id *)&self->_widgetSpec, 0);
  objc_storeStrong((id *)&self->_compositionSpec, 0);
}

@end

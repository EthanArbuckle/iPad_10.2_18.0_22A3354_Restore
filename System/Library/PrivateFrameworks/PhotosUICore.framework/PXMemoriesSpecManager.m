@implementation PXMemoriesSpecManager

- (PXMemoriesSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return -[PXMemoriesSpecManager initWithExtendedTraitCollection:options:style:](self, "initWithExtendedTraitCollection:options:style:", a3, a4, 0);
}

- (PXMemoriesSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 style:(unint64_t)a5
{
  PXMemoriesSpecManager *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXMemoriesSpecManager;
  result = -[PXFeatureSpecManager initWithExtendedTraitCollection:options:](&v7, sel_initWithExtendedTraitCollection_options_, a3, a4);
  if (result)
    result->_style = a5;
  return result;
}

- (BOOL)shouldUpdateSpecForExtendedTraitCollection:(id)a3 change:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  BOOL v11;
  objc_super v13;

  v6 = a3;
  if ((a4 & 0x100) != 0)
  {
    -[PXFeatureSpecManager extendedTraitCollection](self, "extendedTraitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "userInterfaceIdiom") != 3)
    {
      -[PXFeatureSpecManager spec](self, "spec");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "safeAreaInsets");
      PXEdgeInsetsForEdges();

      objc_msgSend(v7, "safeAreaInsets");
      PXEdgeInsetsForEdges();
      if (PXEdgeInsetsEqualToEdgeInsets())
        v9 = a4 & 0xFFFFFFFFFFFFFEFFLL;
      else
        v9 = a4;
      -[PXFeatureSpecManager spec](self, "spec");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "layoutMargins");
      PXEdgeInsetsForEdges();

      objc_msgSend(v7, "layoutMargins");
      PXEdgeInsetsForEdges();
      if (PXEdgeInsetsEqualToEdgeInsets())
        a4 = v9 & 0xFFFFFFFFFFFFFDFFLL;
      else
        a4 = v9;
    }

  }
  v13.receiver = self;
  v13.super_class = (Class)PXMemoriesSpecManager;
  v11 = -[PXFeatureSpecManager shouldUpdateSpecForExtendedTraitCollection:change:](&v13, sel_shouldUpdateSpecForExtendedTraitCollection_change_, v6, a4);

  return v11;
}

- (Class)specClass
{
  return (Class)objc_opt_class();
}

- (id)createSpec
{
  void *v3;
  PXMemoriesSpec *v4;

  -[PXFeatureSpecManager extendedTraitCollection](self, "extendedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXMemoriesSpec initWithExtendedTraitCollection:options:style:]([PXMemoriesSpec alloc], "initWithExtendedTraitCollection:options:style:", v3, -[PXFeatureSpecManager options](self, "options"), -[PXMemoriesSpecManager style](self, "style"));

  return v4;
}

- (unint64_t)style
{
  return self->_style;
}

@end

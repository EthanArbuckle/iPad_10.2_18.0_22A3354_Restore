@implementation PXPhotosDetailsAssetsSpecManager

- (Class)specClass
{
  return (Class)objc_opt_class();
}

- (PXPhotosDetailsAssetsSpecManager)initWithExtendedTraitCollection:(id)a3 detailsOptions:(unint64_t)a4
{
  return -[PXPhotosDetailsAssetsSpecManager initWithExtendedTraitCollection:options:detailsOptions:](self, "initWithExtendedTraitCollection:options:detailsOptions:", a3, 0, a4);
}

- (PXPhotosDetailsAssetsSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return -[PXPhotosDetailsAssetsSpecManager initWithExtendedTraitCollection:options:detailsOptions:](self, "initWithExtendedTraitCollection:options:detailsOptions:", a3, a4, 0);
}

- (PXPhotosDetailsAssetsSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 detailsOptions:(unint64_t)a5
{
  PXPhotosDetailsAssetsSpecManager *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXPhotosDetailsAssetsSpecManager;
  result = -[PXFeatureSpecManager initWithExtendedTraitCollection:options:](&v7, sel_initWithExtendedTraitCollection_options_, a3, a4);
  if (result)
    result->_detailsOptions = a5;
  return result;
}

- (id)createSpec
{
  void *v3;
  PXPhotosDetailsAssetsSpec *v4;

  -[PXFeatureSpecManager extendedTraitCollection](self, "extendedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXPhotosDetailsAssetsSpec initWithExtendedTraitCollection:detailsOptions:]([PXPhotosDetailsAssetsSpec alloc], "initWithExtendedTraitCollection:detailsOptions:", v3, -[PXPhotosDetailsAssetsSpecManager detailsOptions](self, "detailsOptions"));

  return v4;
}

- (unint64_t)detailsOptions
{
  return self->_detailsOptions;
}

@end

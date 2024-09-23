@implementation PXPhotosDetailsSpecManager

- (PXPhotosDetailsSpecManager)initWithExtendedTraitCollection:(id)a3 detailsOptions:(unint64_t)a4
{
  return -[PXPhotosDetailsSpecManager initWithExtendedTraitCollection:options:detailsOptions:](self, "initWithExtendedTraitCollection:options:detailsOptions:", a3, 0, a4);
}

- (PXPhotosDetailsSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return -[PXPhotosDetailsSpecManager initWithExtendedTraitCollection:options:detailsOptions:](self, "initWithExtendedTraitCollection:options:detailsOptions:", a3, a4, 0);
}

- (PXPhotosDetailsSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 detailsOptions:(unint64_t)a5
{
  objc_super v6;

  self->_detailsOptions = a5;
  v6.receiver = self;
  v6.super_class = (Class)PXPhotosDetailsSpecManager;
  return -[PXFeatureSpecManager initWithExtendedTraitCollection:options:](&v6, sel_initWithExtendedTraitCollection_options_, a3, a4);
}

- (id)createSpec
{
  void *v3;
  PXPhotosDetailsSpec *v4;

  -[PXFeatureSpecManager extendedTraitCollection](self, "extendedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXPhotosDetailsSpec initWithExtendedTraitCollection:options:detailsOptions:]([PXPhotosDetailsSpec alloc], "initWithExtendedTraitCollection:options:detailsOptions:", v3, -[PXFeatureSpecManager options](self, "options"), -[PXPhotosDetailsSpecManager detailsOptions](self, "detailsOptions"));

  return v4;
}

- (unint64_t)detailsOptions
{
  return self->_detailsOptions;
}

@end

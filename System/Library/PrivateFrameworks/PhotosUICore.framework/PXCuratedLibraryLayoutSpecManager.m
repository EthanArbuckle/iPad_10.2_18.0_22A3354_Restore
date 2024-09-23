@implementation PXCuratedLibraryLayoutSpecManager

- (id)createSpec
{
  PXCuratedLibraryLayoutSpec *v3;
  void *v4;
  PXCuratedLibraryLayoutSpec *v5;

  v3 = [PXCuratedLibraryLayoutSpec alloc];
  -[PXFeatureSpecManager extendedTraitCollection](self, "extendedTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXCuratedLibraryLayoutSpec initWithExtendedTraitCollection:options:variant:](v3, "initWithExtendedTraitCollection:options:variant:", v4, -[PXFeatureSpecManager options](self, "options"), -[PXCuratedLibraryLayoutSpecManager variant](self, "variant"));

  return v5;
}

- (BOOL)shouldUpdateSpecForExtendedTraitCollection:(id)a3 change:(unint64_t)a4
{
  int v4;
  id v5;
  void *v6;
  BOOL v7;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  v7 = (v4 & 0x10) != 0 && objc_msgSend(v5, "layoutSizeClass") == 2 && objc_msgSend(v6, "userInterfaceIdiom") != 5
    || (*(_QWORD *)&v4 & 0x41D0ALL) != 0;

  return v7;
}

- (int64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(int64_t)a3
{
  if (self->_variant != a3)
  {
    self->_variant = a3;
    -[PXFeatureSpecManager invalidateSpec](self, "invalidateSpec");
  }
}

- (void)setAvailableThumbnailSizes:(id)a3
{
  objc_storeStrong((id *)&self->_availableThumbnailSizes, a3);
}

- (NSArray)availableThumbnailSizes
{
  return self->_availableThumbnailSizes;
}

- (PXCuratedLibraryLayoutSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5
{
  PXCuratedLibraryLayoutSpecManager *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXCuratedLibraryLayoutSpecManager;
  result = -[PXFeatureSpecManager initWithExtendedTraitCollection:options:](&v7, sel_initWithExtendedTraitCollection_options_, a3, a4);
  if (result)
    result->_variant = a5;
  return result;
}

- (Class)specClass
{
  return (Class)objc_opt_class();
}

- (PXCuratedLibraryLayoutSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return -[PXCuratedLibraryLayoutSpecManager initWithExtendedTraitCollection:options:variant:](self, "initWithExtendedTraitCollection:options:variant:", a3, a4, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableThumbnailSizes, 0);
}

@end

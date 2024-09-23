@implementation PXPhotosDetailsActionsSpec

- (PXPhotosDetailsActionsSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  PXPhotosDetailsActionsSpec *v4;
  PXPhotosDetailsActionsSpec *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXPhotosDetailsActionsSpec;
  v4 = -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v7, sel_initWithExtendedTraitCollection_options_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_shouldShowSeparators = 0;
    v4->_shouldInsetAllSeparators = -[PXFeatureSpec shouldInsetAllPhotoDetailsContent](v4, "shouldInsetAllPhotoDetailsContent");
  }
  return v5;
}

- (BOOL)shouldShowSeparators
{
  return self->_shouldShowSeparators;
}

- (BOOL)shouldInsetAllSeparators
{
  return self->_shouldInsetAllSeparators;
}

@end

@implementation PUImportOneUpViewControllerSpecManager

- (PUImportOneUpViewControllerSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return -[PUImportOneUpViewControllerSpecManager initWithExtendedTraitCollection:options:style:](self, "initWithExtendedTraitCollection:options:style:", a3, a4, 0);
}

- (PUImportOneUpViewControllerSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 style:(unint64_t)a5
{
  PUImportOneUpViewControllerSpecManager *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUImportOneUpViewControllerSpecManager;
  result = -[PXFeatureSpecManager initWithExtendedTraitCollection:options:](&v7, sel_initWithExtendedTraitCollection_options_, a3, a4);
  if (result)
    result->_style = a5;
  return result;
}

- (Class)specClass
{
  return (Class)objc_opt_class();
}

- (id)createSpec
{
  void *v3;
  PUImportOneUpViewControllerSpec *v4;

  -[PXFeatureSpecManager extendedTraitCollection](self, "extendedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUImportOneUpViewControllerSpec initWithExtendedTraitCollection:options:style:]([PUImportOneUpViewControllerSpec alloc], "initWithExtendedTraitCollection:options:style:", v3, -[PXFeatureSpecManager options](self, "options"), -[PUImportOneUpViewControllerSpecManager style](self, "style"));

  return v4;
}

- (unint64_t)style
{
  return self->_style;
}

@end

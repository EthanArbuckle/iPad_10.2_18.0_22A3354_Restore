@implementation PXCMMSpecManager

- (PXCMMSpecManager)initWithExtendedTraitCollection:(id)a3 activityType:(unint64_t)a4
{
  return -[PXCMMSpecManager initWithExtendedTraitCollection:options:activityType:](self, "initWithExtendedTraitCollection:options:activityType:", a3, 0, a4);
}

- (PXCMMSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return -[PXCMMSpecManager initWithExtendedTraitCollection:options:activityType:](self, "initWithExtendedTraitCollection:options:activityType:", a3, a4, 0);
}

- (PXCMMSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 activityType:(unint64_t)a5
{
  PXCMMSpecManager *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXCMMSpecManager;
  result = -[PXFeatureSpecManager initWithExtendedTraitCollection:options:](&v7, sel_initWithExtendedTraitCollection_options_, a3, a4);
  if (result)
    result->_activityType = a5;
  return result;
}

- (id)createSpec
{
  void *v3;
  PXCMMSpec *v4;

  -[PXFeatureSpecManager extendedTraitCollection](self, "extendedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXCMMSpec initWithExtendedTraitCollection:options:activityType:]([PXCMMSpec alloc], "initWithExtendedTraitCollection:options:activityType:", v3, -[PXFeatureSpecManager options](self, "options"), -[PXCMMSpecManager activityType](self, "activityType"));

  return v4;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

@end

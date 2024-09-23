@implementation PhotosPagingLayoutSpecManager

- (id)createSpec
{
  _TtC12PhotosUICore29PhotosPagingLayoutSpecManager *v2;
  PXExtendedTraitCollection *v3;
  id v4;
  id result;

  v2 = self;
  v3 = -[PXFeatureSpecManager extendedTraitCollection](v2, sel_extendedTraitCollection);
  v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PhotosPagingLayoutSpec()), sel_initWithExtendedTraitCollection_options_, v3, -[PXFeatureSpecManager options](v2, sel_options));

  if (v4)
  {

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (Class)specClass
{
  type metadata accessor for PhotosPagingLayoutSpec();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC12PhotosUICore29PhotosPagingLayoutSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PhotosPagingLayoutSpecManager();
  return -[PXFeatureSpecManager initWithExtendedTraitCollection:options:](&v7, sel_initWithExtendedTraitCollection_options_, a3, a4);
}

@end

@implementation PhotosPagingLayoutSpec

- (_TtC12PhotosUICore22PhotosPagingLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  objc_super v7;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12PhotosUICore22PhotosPagingLayoutSpec_interPageSpacing) = (Class)0x4024000000000000;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PhotosPagingLayoutSpec();
  return -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v7, sel_initWithExtendedTraitCollection_options_, a3, a4);
}

@end

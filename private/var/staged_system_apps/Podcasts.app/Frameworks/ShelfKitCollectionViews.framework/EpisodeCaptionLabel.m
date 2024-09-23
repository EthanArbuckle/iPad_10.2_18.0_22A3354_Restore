@implementation EpisodeCaptionLabel

- (_TtC23ShelfKitCollectionViews19EpisodeCaptionLabel)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC23ShelfKitCollectionViews19EpisodeCaptionLabel *result;
  _QWORD *v9;
  objc_class *v10;
  objc_super v11;
  _BYTE v12[24];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_beginAccess(&off_3D3FF8, v12, 0, 0);
  if (off_3D3FF8)
  {
    sub_1D5D4((uint64_t)(off_3D3FF8 + 6), (uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews19EpisodeCaptionLabel_storeDataProvider);
    v9 = (Class *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC23ShelfKitCollectionViews19EpisodeCaptionLabel_caption);
    v10 = (objc_class *)type metadata accessor for EpisodeCaptionLabel();
    *v9 = 0;
    v9[1] = 0;
    v11.receiver = self;
    v11.super_class = v10;
    return -[DynamicTypeLabel initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC23ShelfKitCollectionViews19EpisodeCaptionLabel)initWithCoder:(id)a3
{
  _TtC23ShelfKitCollectionViews19EpisodeCaptionLabel *result;

  sub_1385C8(a3);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.super.super.super.super.isa
                                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews19EpisodeCaptionLabel_storeDataProvider));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews19EpisodeCaptionLabel_caption]);
}

@end

@implementation InformationCell

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v6.receiver;
  -[InformationCell traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_121750();

}

- (_TtC23ShelfKitCollectionViews15InformationCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationCell_kind) = 13;
  v9 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationCell_info;
  v10 = type metadata accessor for Information(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationCell_shouldShowChevron) = 0;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationCell_shouldShowDownwardChevron) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationCell_objectGraph) = 0;
  v11 = (Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationCell_reload);
  *v11 = 0;
  v11[1] = 0;
  v13.receiver = self;
  v13.super_class = ObjectType;
  return -[InformationCell initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews15InformationCell)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViews15InformationCell *)sub_122544(a3);
}

- (void).cxx_destruct
{
  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationCell_info, &qword_3D7810);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationCell_objectGraph));
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationCell_reload), *(_QWORD *)&self->kind[OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationCell_reload]);
}

@end

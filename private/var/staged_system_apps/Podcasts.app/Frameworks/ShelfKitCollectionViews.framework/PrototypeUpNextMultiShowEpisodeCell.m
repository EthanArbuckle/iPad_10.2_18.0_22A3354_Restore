@implementation PrototypeUpNextMultiShowEpisodeCell

- (_TtC23ShelfKitCollectionViews35PrototypeUpNextMultiShowEpisodeCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _QWORD *v9;
  _TtC23ShelfKitCollectionViews35PrototypeUpNextMultiShowEpisodeCell *v10;
  id v11;
  id v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews35PrototypeUpNextMultiShowEpisodeCell____lazy_storage___infoButton) = 0;
  v9 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC23ShelfKitCollectionViews35PrototypeUpNextMultiShowEpisodeCell_podcastUuid);
  *v9 = 0;
  v9[1] = 0;
  v14.receiver = self;
  v14.super_class = ObjectType;
  v10 = -[MultiShowEpisodeCell initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  v11 = -[PrototypeUpNextMultiShowEpisodeCell contentView](v10, "contentView");
  v12 = sub_1523A0();
  objc_msgSend(v11, "addSubview:", v12);

  return v10;
}

- (_TtC23ShelfKitCollectionViews35PrototypeUpNextMultiShowEpisodeCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_152F94();
}

- (void)buttonPressed
{
  _TtC23ShelfKitCollectionViews35PrototypeUpNextMultiShowEpisodeCell *v2;

  v2 = self;
  sub_15289C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews35PrototypeUpNextMultiShowEpisodeCell____lazy_storage___infoButton));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.objectGraph[OBJC_IVAR____TtC23ShelfKitCollectionViews35PrototypeUpNextMultiShowEpisodeCell_podcastUuid]);
}

@end

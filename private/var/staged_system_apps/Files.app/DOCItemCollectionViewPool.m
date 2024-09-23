@implementation DOCItemCollectionViewPool

- (_TtC5Files25DOCItemCollectionViewPool)initWithConfiguration:(id)a3
{
  id v3;
  _TtC5Files25DOCItemCollectionViewPool *v4;

  v3 = a3;
  v4 = (_TtC5Files25DOCItemCollectionViewPool *)sub_10000E6CC(v3);

  return v4;
}

- (_TtC5Files25DOCItemCollectionViewPool)init
{
  _TtC5Files25DOCItemCollectionViewPool *result;

  result = (_TtC5Files25DOCItemCollectionViewPool *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCItemCollectionViewPool", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Files25DOCItemCollectionViewPool_collectionViews));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Files25DOCItemCollectionViewPool____lazy_storage___notificationsController));
}

@end

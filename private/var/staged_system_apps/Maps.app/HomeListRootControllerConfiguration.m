@implementation HomeListRootControllerConfiguration

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC4Maps35HomeListRootControllerConfiguration_collectionView));
}

- (HomeActionDelegate)homeActionDelegate
{
  return (HomeActionDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC4Maps35HomeListRootControllerConfiguration_homeActionDelegate);
}

- (void)setHomeActionDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC4Maps35HomeListRootControllerConfiguration_homeActionDelegate, a3);
}

- (HomeUpdateDelegate)homeUpdateDelegate
{
  return (HomeUpdateDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC4Maps35HomeListRootControllerConfiguration_homeUpdateDelegate);
}

- (void)setHomeUpdateDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC4Maps35HomeListRootControllerConfiguration_homeUpdateDelegate, a3);
}

- (_TtC4Maps35HomeListRootControllerConfiguration)initWithCollectionView:(id)a3
{
  id v5;
  objc_super v7;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC4Maps35HomeListRootControllerConfiguration_homeActionDelegate);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC4Maps35HomeListRootControllerConfiguration_homeUpdateDelegate);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps35HomeListRootControllerConfiguration_collectionView) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HomeListRootControllerConfiguration();
  v5 = a3;
  return -[HomeListRootControllerConfiguration init](&v7, "init");
}

- (_TtC4Maps35HomeListRootControllerConfiguration)init
{
  _TtC4Maps35HomeListRootControllerConfiguration *result;

  result = (_TtC4Maps35HomeListRootControllerConfiguration *)_swift_stdlib_reportUnimplementedInitializer("Maps.HomeListRootControllerConfiguration", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps35HomeListRootControllerConfiguration_collectionView));
  sub_100017510((uint64_t)self + OBJC_IVAR____TtC4Maps35HomeListRootControllerConfiguration_homeActionDelegate);
  sub_100017510((uint64_t)self + OBJC_IVAR____TtC4Maps35HomeListRootControllerConfiguration_homeUpdateDelegate);
}

@end

@implementation SnapshotViewController

- (_TtC11WeatherMaps22SnapshotViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBF99910();
}

- (void)dealloc
{
  _TtC11WeatherMaps22SnapshotViewController *v2;

  v2 = self;
  sub_1DBF99A04();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps22SnapshotViewController_annotationViewModelFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps22SnapshotViewController_mapLocationAccessibilityModelManager);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps22SnapshotViewController_snapshotManager);
  sub_1DBE92730((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps22SnapshotViewController_snapshotJob, &qword_1EDAFC670);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps22SnapshotViewController____lazy_storage___snapshotView));
  sub_1DBECE368(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11WeatherMaps22SnapshotViewController_onMapEventHandler));
  sub_1DBE927A0((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps22SnapshotViewController_snapshotConfiguration, type metadata accessor for SnapshotViewController.SnapshotConfiguration);
}

- (void)viewDidLoad
{
  _TtC11WeatherMaps22SnapshotViewController *v2;

  v2 = self;
  sub_1DBF99D14();

}

- (void)viewDidLayoutSubviews
{
  _TtC11WeatherMaps22SnapshotViewController *v2;

  v2 = self;
  sub_1DBF9A280();

}

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC11WeatherMaps22SnapshotViewController *v4;

  v4 = self;
  sub_1DBF9A42C(a3);

}

- (_TtC11WeatherMaps22SnapshotViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DBFF81A0();
  v5 = a4;
  sub_1DBF9BEC8();
}

@end

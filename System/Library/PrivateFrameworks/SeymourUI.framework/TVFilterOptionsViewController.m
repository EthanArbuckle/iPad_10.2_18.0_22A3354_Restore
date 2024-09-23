@implementation TVFilterOptionsViewController

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3;
  _TtC9SeymourUI29TVFilterOptionsViewController *v4;
  char *v5;
  id v6;
  void *v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255B84960);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22BA90150;
  v4 = self;
  swift_retain();
  v5 = (char *)sub_22B9D1164();
  swift_release();
  v6 = *(id *)&v5[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];

  *(_QWORD *)(v3 + 32) = v6;
  sub_22BA808D4();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v7 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v7;
}

- (_TtC9SeymourUI29TVFilterOptionsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B72F2FC();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI29TVFilterOptionsViewController *v2;

  v2 = self;
  sub_22B72E02C();

}

- (void)menuButtonTapped
{
  _TtC9SeymourUI29TVFilterOptionsViewController *v2;

  v2 = self;
  sub_22B72E3A0();

}

- (_TtC9SeymourUI29TVFilterOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI29TVFilterOptionsViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI29TVFilterOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29TVFilterOptionsViewController_pageNavigator);
  swift_release();
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29TVFilterOptionsViewController_lastFocusedIndexPath, &qword_255B87230);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29TVFilterOptionsViewController_timerProvider);
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29TVFilterOptionsViewController_metricPublishingDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29TVFilterOptionsViewController_titleLabel));
}

@end

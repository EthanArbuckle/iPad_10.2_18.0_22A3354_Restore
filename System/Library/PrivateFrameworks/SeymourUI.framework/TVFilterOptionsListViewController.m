@implementation TVFilterOptionsListViewController

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255B84960);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22BA90150;
  v4 = *(void **)((*(_QWORD **)((char *)&self->super.super.super.isa
                              + OBJC_IVAR____TtC9SeymourUI33TVFilterOptionsListViewController_dataProvider))[5]
                + OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView);
  *(_QWORD *)(v3 + 32) = v4;
  sub_22BA808D4();
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v6 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (_TtC9SeymourUI33TVFilterOptionsListViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B18B548();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI33TVFilterOptionsListViewController *v2;

  v2 = self;
  sub_22B18A3B0();

}

- (void)menuButtonTapped
{
  _TtC9SeymourUI33TVFilterOptionsListViewController *v2;

  v2 = self;
  sub_22B18AAE8();

}

- (void)handleActionButtonTapped
{
  _TtC9SeymourUI33TVFilterOptionsListViewController *v2;

  v2 = self;
  sub_22B77F964();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVFilterOptionsListViewController();
  v4 = v5.receiver;
  -[TVFilterOptionsListViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_22B7C8988();

}

- (_TtC9SeymourUI33TVFilterOptionsListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI33TVFilterOptionsListViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI33TVFilterOptionsListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_22B18BA1C((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33TVFilterOptionsListViewController_lastFocusedIndexPath);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33TVFilterOptionsListViewController_timerProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33TVFilterOptionsListViewController_optionsActionsHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33TVFilterOptionsListViewController_optionsActionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33TVFilterOptionsListViewController_titleLabel));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33TVFilterOptionsListViewController_pageNavigator);
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33TVFilterOptionsListViewController_metricPublishingDelegate);
}

@end

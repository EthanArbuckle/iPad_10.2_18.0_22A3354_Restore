@implementation TVWorkoutPlanDetailViewController

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
                              + OBJC_IVAR____TtC9SeymourUI33TVWorkoutPlanDetailViewController_dataProvider))[61]
                + OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView);
  *(_QWORD *)(v3 + 32) = v4;
  sub_22BA808D4();
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v6 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (_TtC9SeymourUI33TVWorkoutPlanDetailViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B7AEFDC();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI33TVWorkoutPlanDetailViewController *v2;

  v2 = self;
  TVWorkoutPlanDetailViewController.viewDidLoad()();

}

- (void)viewDidLayoutSubviews
{
  _TtC9SeymourUI33TVWorkoutPlanDetailViewController *v2;

  v2 = self;
  TVWorkoutPlanDetailViewController.viewDidLayoutSubviews()();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC9SeymourUI33TVWorkoutPlanDetailViewController *v10;
  _QWORD v11[2];
  objc_super v12;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = sub_22BA79CF8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = self;
  -[TVWorkoutPlanDetailViewController viewDidAppear:](&v12, sel_viewDidAppear_, v3);
  v11[1] = *(Class *)((char *)&v10->super.super.super.isa
                    + OBJC_IVAR____TtC9SeymourUI33TVWorkoutPlanDetailViewController_dataProvider);
  sub_22B7F0714((uint64_t)v9);
  type metadata accessor for TVWorkoutPlanDetailPageDataProvider();
  sub_22B0F3C60(&qword_255BACAD8, (uint64_t (*)(uint64_t))type metadata accessor for TVWorkoutPlanDetailPageDataProvider, (uint64_t)&unk_22BAB7CD8);
  sub_22BA7DC94();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_22B0F3C60(&qword_255BACAE0, (uint64_t (*)(uint64_t))type metadata accessor for TVWorkoutPlanDetailViewController, (uint64_t)&protocol conformance descriptor for TVWorkoutPlanDetailViewController);
  sub_22B0F3C60((unint64_t *)&unk_255BACAE8, (uint64_t (*)(uint64_t))type metadata accessor for TVWorkoutPlanDetailViewController, (uint64_t)&protocol conformance descriptor for TVWorkoutPlanDetailViewController);
  sub_22BA7E1D4();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI33TVWorkoutPlanDetailViewController *v4;

  v4 = self;
  TVWorkoutPlanDetailViewController.viewWillDisappear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[TVWorkoutPlanDetailViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  sub_22B0F3C60(&qword_255BACAE0, (uint64_t (*)(uint64_t))type metadata accessor for TVWorkoutPlanDetailViewController, (uint64_t)&protocol conformance descriptor for TVWorkoutPlanDetailViewController);
  sub_22B0F3C60((unint64_t *)&unk_255BACAE8, (uint64_t (*)(uint64_t))type metadata accessor for TVWorkoutPlanDetailViewController, (uint64_t)&protocol conformance descriptor for TVWorkoutPlanDetailViewController);
  sub_22BA7E1E0();

}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI33TVWorkoutPlanDetailViewController_titleLabel));
}

- (_TtC9SeymourUI33TVWorkoutPlanDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI33TVWorkoutPlanDetailViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI33TVWorkoutPlanDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33TVWorkoutPlanDetailViewController_pageNavigator);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33TVWorkoutPlanDetailViewController_storefrontLocalizer);
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33TVWorkoutPlanDetailViewController_lastFocusedIndexPath, &qword_255B87230);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33TVWorkoutPlanDetailViewController_timerProvider);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33TVWorkoutPlanDetailViewController_titleLabel));
}

@end

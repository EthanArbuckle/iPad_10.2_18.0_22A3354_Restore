@implementation TVCatalogProgramDetailViewController

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
                              + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_dataProvider))[51]
                + OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView);
  *(_QWORD *)(v3 + 32) = v4;
  sub_22BA808D4();
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v6 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (_TtC9SeymourUI36TVCatalogProgramDetailViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B1C8978();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI36TVCatalogProgramDetailViewController *v2;

  v2 = self;
  sub_22B1C74E8();

}

- (void)viewDidLayoutSubviews
{
  _TtC9SeymourUI36TVCatalogProgramDetailViewController *v2;

  v2 = self;
  sub_22B1C761C();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVCatalogProgramDetailViewController();
  v4 = v5.receiver;
  -[TVCatalogProgramDetailViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  sub_22B0F3C60(&qword_255B87238, (uint64_t (*)(uint64_t))type metadata accessor for TVCatalogProgramDetailViewController, (uint64_t)&unk_22BA931D0);
  sub_22B0F3C60(&qword_255B87258, (uint64_t (*)(uint64_t))type metadata accessor for TVCatalogProgramDetailViewController, (uint64_t)&unk_22BA93158);
  sub_22BA7E1E0();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9SeymourUI36TVCatalogProgramDetailViewController *v4;

  v4 = self;
  sub_22B1C7870(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI36TVCatalogProgramDetailViewController *v4;

  v4 = self;
  sub_22B1C7AC4(a3);

}

- (_TtC9SeymourUI36TVCatalogProgramDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI36TVCatalogProgramDetailViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI36TVCatalogProgramDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_storefrontLocalizer);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_purchaseCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_purchaseHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_dynamicOfferCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_webUserInterfaceCoordinator));
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_lastFocusedIndexPath, &qword_255B87230);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_timerProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_shroudView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_bottomBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_ellipsisButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_menu));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVCatalogProgramDetailViewController_gradientMaskLayer));
}

@end

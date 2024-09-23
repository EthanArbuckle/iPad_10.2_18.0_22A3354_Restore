@implementation TVCatalogEditorialCollectionDetailViewController

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
                              + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_dataProvider))[6]
                + OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView);
  *(_QWORD *)(v3 + 32) = v4;
  sub_22BA808D4();
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v6 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (_TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B432048();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController *v2;

  v2 = self;
  sub_22B430370();

}

- (void)viewDidLayoutSubviews
{
  _TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController *v2;

  v2 = self;
  sub_22B430564();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVCatalogEditorialCollectionDetailViewController();
  v4 = v5.receiver;
  -[TVCatalogEditorialCollectionDetailViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  sub_22B0F3C60(&qword_255B96DE0, (uint64_t (*)(uint64_t))type metadata accessor for TVCatalogEditorialCollectionDetailViewController, (uint64_t)&protocol conformance descriptor for TVCatalogEditorialCollectionDetailViewController);
  sub_22B0F3C60(&qword_255B96DE8, (uint64_t (*)(uint64_t))type metadata accessor for TVCatalogEditorialCollectionDetailViewController, (uint64_t)&protocol conformance descriptor for TVCatalogEditorialCollectionDetailViewController);
  sub_22BA7E1E0();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  objc_class *v9;
  _TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController *v10;
  _QWORD v11[2];
  objc_super v12;

  v3 = a3;
  v5 = sub_22BA79CF8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (objc_class *)type metadata accessor for TVCatalogEditorialCollectionDetailViewController();
  v12.receiver = self;
  v12.super_class = v9;
  v10 = self;
  -[TVCatalogEditorialCollectionDetailViewController viewDidAppear:](&v12, sel_viewDidAppear_, v3);
  v11[1] = *(Class *)((char *)&v10->super.super.super.isa
                    + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_dataProvider);
  sub_22B669248((uint64_t)v8);
  type metadata accessor for TVCatalogEditorialCollectionDetailPageDataProvider();
  sub_22B0F3C60((unint64_t *)&unk_255B96DF0, (uint64_t (*)(uint64_t))type metadata accessor for TVCatalogEditorialCollectionDetailPageDataProvider, (uint64_t)&unk_22BAAEC90);
  sub_22BA7DC94();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_22B0F3C60(&qword_255B96DE0, (uint64_t (*)(uint64_t))type metadata accessor for TVCatalogEditorialCollectionDetailViewController, (uint64_t)&protocol conformance descriptor for TVCatalogEditorialCollectionDetailViewController);
  sub_22B0F3C60(&qword_255B96DE8, (uint64_t (*)(uint64_t))type metadata accessor for TVCatalogEditorialCollectionDetailViewController, (uint64_t)&protocol conformance descriptor for TVCatalogEditorialCollectionDetailViewController);
  sub_22BA7E1D4();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController *v4;

  v4 = self;
  sub_22B430918(a3);

}

- (_TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_pageNavigator);
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_lastFocusedIndexPath, &qword_255B87230);
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_gradientMaskLayer));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_storefrontLocalizer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_timerProvider);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_bottomBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_shroudView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_ellipsisButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI48TVCatalogEditorialCollectionDetailViewController_menu));
}

@end

@implementation CatalogEditorialCollectionDetailViewController

- (_TtC9SeymourUI46CatalogEditorialCollectionDetailViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B712570();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI46CatalogEditorialCollectionDetailViewController *v2;

  v2 = self;
  sub_22B710E0C();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  objc_class *v9;
  _TtC9SeymourUI46CatalogEditorialCollectionDetailViewController *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];
  objc_super v15;

  v3 = a3;
  v5 = sub_22BA79CF8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (objc_class *)type metadata accessor for CatalogEditorialCollectionDetailViewController();
  v15.receiver = self;
  v15.super_class = v9;
  v10 = self;
  -[CatalogEditorialCollectionDetailViewController viewDidAppear:](&v15, sel_viewDidAppear_, v3);
  v11 = *(uint64_t *)((char *)&v10->super.super.super.isa
                   + OBJC_IVAR____TtC9SeymourUI46CatalogEditorialCollectionDetailViewController_dataProvider);
  sub_22B9042CC();
  v14[1] = v11;
  sub_22B90447C((uint64_t)v8);
  type metadata accessor for CatalogEditorialCollectionPageDataProvider();
  sub_22B106EC0(&qword_255BA9C88, 255, (uint64_t (*)(uint64_t))type metadata accessor for CatalogEditorialCollectionPageDataProvider, (uint64_t)&unk_22BABD6F0);
  sub_22BA7DC94();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_22B106EC0(&qword_255BA9C70, v12, (uint64_t (*)(uint64_t))type metadata accessor for CatalogEditorialCollectionDetailViewController, (uint64_t)&unk_22BAB33E0);
  sub_22B106EC0(&qword_255BA9C80, v13, (uint64_t (*)(uint64_t))type metadata accessor for CatalogEditorialCollectionDetailViewController, (uint64_t)&unk_22BAB3368);
  sub_22BA7E1D4();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CatalogEditorialCollectionDetailViewController();
  v4 = v7.receiver;
  -[CatalogEditorialCollectionDetailViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
  sub_22B106EC0(&qword_255BA9C70, v5, (uint64_t (*)(uint64_t))type metadata accessor for CatalogEditorialCollectionDetailViewController, (uint64_t)&unk_22BAB33E0);
  sub_22B106EC0(&qword_255BA9C80, v6, (uint64_t (*)(uint64_t))type metadata accessor for CatalogEditorialCollectionDetailViewController, (uint64_t)&unk_22BAB3368);
  sub_22BA7E1E0();

}

- (void)viewDidLayoutSubviews
{
  char *v2;
  char *v3;
  void *v4;
  char *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CatalogEditorialCollectionDetailViewController();
  v2 = (char *)v10.receiver;
  -[CatalogEditorialCollectionDetailViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  v3 = *(char **)(*(_QWORD *)&v2[OBJC_IVAR____TtC9SeymourUI46CatalogEditorialCollectionDetailViewController_dataProvider]
                + 32);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(_QWORD *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_22B47C120(v6, v7, v8, v9);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9SeymourUI46CatalogEditorialCollectionDetailViewController *v4;

  v4 = self;
  sub_22B711244(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI46CatalogEditorialCollectionDetailViewController *v4;

  v4 = self;
  sub_22B711424(a3);

}

- (void)viewIsAppearing:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  double v5;
  double v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CatalogEditorialCollectionDetailViewController();
  v4 = (char *)v7.receiver;
  -[CatalogEditorialCollectionDetailViewController viewIsAppearing:](&v7, sel_viewIsAppearing_, v3);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)&v4[OBJC_IVAR____TtC9SeymourUI46CatalogEditorialCollectionDetailViewController_dataProvider]+ 32)+ OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView), sel_contentOffset, v7.receiver, v7.super_class);
  sub_22B854498(v5, v6);

}

- (void)moreOptionsButtonTapped:(id)a3
{
  _TtC9SeymourUI46CatalogEditorialCollectionDetailViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_22BA812E8();
  swift_unknownObjectRelease();
  sub_22B711964();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC9SeymourUI46CatalogEditorialCollectionDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI46CatalogEditorialCollectionDetailViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI46CatalogEditorialCollectionDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI46CatalogEditorialCollectionDetailViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI46CatalogEditorialCollectionDetailViewController_serviceSubscriptionCache);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI46CatalogEditorialCollectionDetailViewController_storefrontLocalizer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI46CatalogEditorialCollectionDetailViewController_upNextQueueButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI46CatalogEditorialCollectionDetailViewController_standardNavigationBarTintColor));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI46CatalogEditorialCollectionDetailViewController_currentNavigationBarTintColor));
}

@end

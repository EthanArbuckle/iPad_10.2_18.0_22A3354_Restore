@implementation CatalogModalityDetailViewController

- (int64_t)preferredStatusBarStyle
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI35CatalogModalityDetailViewController_currentStatusBarStyle);
}

- (_TtC9SeymourUI35CatalogModalityDetailViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B933ADC();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI35CatalogModalityDetailViewController *v2;

  v2 = self;
  sub_22B931A94();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9SeymourUI35CatalogModalityDetailViewController *v4;

  v4 = self;
  sub_22B931B7C(a3);

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
  v7.super_class = (Class)type metadata accessor for CatalogModalityDetailViewController();
  v4 = (char *)v7.receiver;
  -[CatalogModalityDetailViewController viewIsAppearing:](&v7, sel_viewIsAppearing_, v3);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)&v4[OBJC_IVAR____TtC9SeymourUI35CatalogModalityDetailViewController_dataProvider]+ OBJC_IVAR____TtC9SeymourUI31CatalogModalityPageDataProvider_page)+ OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView), sel_contentOffset, v7.receiver, v7.super_class);
  sub_22B855264(v5, v6);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9SeymourUI35CatalogModalityDetailViewController *v4;

  v4 = self;
  sub_22B931DF4(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI35CatalogModalityDetailViewController *v4;

  v4 = self;
  sub_22B932048(a3);

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
  v7.super_class = (Class)type metadata accessor for CatalogModalityDetailViewController();
  v4 = v7.receiver;
  -[CatalogModalityDetailViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
  sub_22B106EC0(&qword_255BB5138, v5, (uint64_t (*)(uint64_t))type metadata accessor for CatalogModalityDetailViewController, (uint64_t)&unk_22BABE888);
  sub_22B106EC0(&qword_255BB5140, v6, (uint64_t (*)(uint64_t))type metadata accessor for CatalogModalityDetailViewController, (uint64_t)&unk_22BABE810);
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
  v10.super_class = (Class)type metadata accessor for CatalogModalityDetailViewController();
  v2 = (char *)v10.receiver;
  -[CatalogModalityDetailViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  v3 = *(char **)(*(_QWORD *)&v2[OBJC_IVAR____TtC9SeymourUI35CatalogModalityDetailViewController_dataProvider]
                + OBJC_IVAR____TtC9SeymourUI31CatalogModalityPageDataProvider_page);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(_QWORD *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_22B47C120(v6, v7, v8, v9);

}

- (void)moreOptionsButtonTapped:(id)a3
{
  _TtC9SeymourUI35CatalogModalityDetailViewController *v4;
  uint64_t v5;
  uint64_t v6;

  swift_unknownObjectRetain();
  v4 = self;
  sub_22BA812E8();
  swift_unknownObjectRelease();
  v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_22B92F56C((void (*)(uint64_t))sub_22B933AC8, v5);

  swift_release_n();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v6);
}

- (_TtC9SeymourUI35CatalogModalityDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI35CatalogModalityDetailViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI35CatalogModalityDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35CatalogModalityDetailViewController_marketingMessageViewControllerHandler));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI35CatalogModalityDetailViewController_pageNavigator);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI35CatalogModalityDetailViewController_serviceSubscriptionCache);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI35CatalogModalityDetailViewController_storefrontLocalizer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35CatalogModalityDetailViewController_upNextQueueButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35CatalogModalityDetailViewController_standardNavigationBarTintColor));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35CatalogModalityDetailViewController_currentNavigationBarTintColor));
}

@end

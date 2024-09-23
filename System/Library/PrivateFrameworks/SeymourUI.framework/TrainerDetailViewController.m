@implementation TrainerDetailViewController

- (int64_t)preferredStatusBarStyle
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI27TrainerDetailViewController_currentStatusBarStyle);
}

- (_TtC9SeymourUI27TrainerDetailViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B39FAD0();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI27TrainerDetailViewController *v2;

  v2 = self;
  sub_22B39DF48();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9SeymourUI27TrainerDetailViewController *v4;

  v4 = self;
  sub_22B39E0C0(a3);

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
  v7.super_class = (Class)type metadata accessor for TrainerDetailViewController();
  v4 = (char *)v7.receiver;
  -[TrainerDetailViewController viewIsAppearing:](&v7, sel_viewIsAppearing_, v3);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)&v4[OBJC_IVAR____TtC9SeymourUI27TrainerDetailViewController_dataProvider]+ OBJC_IVAR____TtC9SeymourUI23TrainerPageDataProvider_page)+ OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView), sel_contentOffset, v7.receiver, v7.super_class);
  sub_22B854414(v5, v6);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9SeymourUI27TrainerDetailViewController *v4;

  v4 = self;
  sub_22B39E338(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI27TrainerDetailViewController *v4;

  v4 = self;
  sub_22B39E58C(a3);

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
  v7.super_class = (Class)type metadata accessor for TrainerDetailViewController();
  v4 = v7.receiver;
  -[TrainerDetailViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
  sub_22B106EC0(&qword_255B92D20, v5, (uint64_t (*)(uint64_t))type metadata accessor for TrainerDetailViewController, (uint64_t)&unk_22BA9D4D0);
  sub_22B106EC0(&qword_255B92D28, v6, (uint64_t (*)(uint64_t))type metadata accessor for TrainerDetailViewController, (uint64_t)&unk_22BA9D458);
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
  v10.super_class = (Class)type metadata accessor for TrainerDetailViewController();
  v2 = (char *)v10.receiver;
  -[TrainerDetailViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  v3 = *(char **)(*(_QWORD *)&v2[OBJC_IVAR____TtC9SeymourUI27TrainerDetailViewController_dataProvider]
                + OBJC_IVAR____TtC9SeymourUI23TrainerPageDataProvider_page);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(_QWORD *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_22B47C120(v6, v7, v8, v9);

}

- (void)moreOptionsButtonTapped:(id)a3
{
  _TtC9SeymourUI27TrainerDetailViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_22BA812E8();
  swift_unknownObjectRelease();
  sub_22B39EBBC();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC9SeymourUI27TrainerDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI27TrainerDetailViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI27TrainerDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27TrainerDetailViewController_pageNavigator);
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27TrainerDetailViewController_serviceSubscriptionCache);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27TrainerDetailViewController_storefrontLocalizer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27TrainerDetailViewController_upNextQueueButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27TrainerDetailViewController_standardNavigationBarTintColor));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27TrainerDetailViewController_currentNavigationBarTintColor));
}

@end

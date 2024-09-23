@implementation PlaylistDetailViewController

- (_TtC9SeymourUI28PlaylistDetailViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B8D9990();
}

- (unint64_t)supportedInterfaceOrientations
{
  if (*((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI28PlaylistDetailViewController_platform) == 1)
    return 30;
  else
    return 2;
}

- (void)viewDidLoad
{
  _TtC9SeymourUI28PlaylistDetailViewController *v2;

  v2 = self;
  PlaylistDetailViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9SeymourUI28PlaylistDetailViewController *v4;

  v4 = self;
  PlaylistDetailViewController.viewWillAppear(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[PlaylistDetailViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_22B8D98A4(&qword_255BB2C48, (uint64_t)&protocol conformance descriptor for PlaylistDetailViewController);
  sub_22BA7DC94();
  sub_22B8D98A4(&qword_255BB2C50, (uint64_t)&protocol conformance descriptor for PlaylistDetailViewController);
  sub_22B8D98A4(qword_255BB2C58, (uint64_t)&protocol conformance descriptor for PlaylistDetailViewController);
  sub_22BA7E1D4();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI28PlaylistDetailViewController *v4;

  v4 = self;
  PlaylistDetailViewController.viewWillDisappear(_:)(a3);

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
  -[PlaylistDetailViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  sub_22B8D98A4(&qword_255BB2C50, (uint64_t)&protocol conformance descriptor for PlaylistDetailViewController);
  sub_22B8D98A4(qword_255BB2C58, (uint64_t)&protocol conformance descriptor for PlaylistDetailViewController);
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
  v10.super_class = (Class)swift_getObjectType();
  v2 = (char *)v10.receiver;
  -[PlaylistDetailViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  v3 = *(char **)(*(_QWORD *)&v2[OBJC_IVAR____TtC9SeymourUI28PlaylistDetailViewController_dataProvider]
                + OBJC_IVAR____TtC9SeymourUI26PlaylistDetailDataProvider_page);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(_QWORD *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_22B47C120(v6, v7, v8, v9);

}

- (void)backButtonPressed
{
  _TtC9SeymourUI28PlaylistDetailViewController *v2;
  _TtC9SeymourUI28PlaylistDetailViewController *v3;
  id v4;
  _TtC9SeymourUI28PlaylistDetailViewController *v5;
  _TtC9SeymourUI28PlaylistDetailViewController *v6;

  v6 = self;
  v2 = (_TtC9SeymourUI28PlaylistDetailViewController *)-[PlaylistDetailViewController navigationController](v6, sel_navigationController);
  if (v2)
  {
    v3 = v2;
    v4 = -[PlaylistDetailViewController popViewControllerAnimated:](v2, sel_popViewControllerAnimated_, 1);

    v5 = v3;
  }
  else
  {
    v5 = v6;
  }

}

- (_TtC9SeymourUI28PlaylistDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI28PlaylistDetailViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI28PlaylistDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28PlaylistDetailViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28PlaylistDetailViewController_bookmarkClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28PlaylistDetailViewController_serviceSubscriptionCache);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28PlaylistDetailViewController_storefrontLocalizer);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28PlaylistDetailViewController_mediaTagStringBuilder);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28PlaylistDetailViewController_queueActionsView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28PlaylistDetailViewController_standardNavigationBarTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28PlaylistDetailViewController_currentNavigationBarTintColor));
}

@end

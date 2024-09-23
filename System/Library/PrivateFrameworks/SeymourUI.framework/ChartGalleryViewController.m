@implementation ChartGalleryViewController

- (_TtC9SeymourUI26ChartGalleryViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B65FF44();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI26ChartGalleryViewController *v2;

  v2 = self;
  sub_22B65E984();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9SeymourUI26ChartGalleryViewController *v4;

  v4 = self;
  sub_22B65EB2C(a3);

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
  v7.super_class = (Class)type metadata accessor for ChartGalleryViewController();
  v4 = (char *)v7.receiver;
  -[ChartGalleryViewController viewIsAppearing:](&v7, sel_viewIsAppearing_, v3);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)&v4[OBJC_IVAR____TtC9SeymourUI26ChartGalleryViewController_dataProvider]+ OBJC_IVAR____TtC9SeymourUI24ChartGalleryDataProvider_page)+ OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView), sel_contentOffset, v7.receiver, v7.super_class);
  sub_22B85446C(v5, v6);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ChartGalleryViewController();
  v4 = v5.receiver;
  -[ChartGalleryViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_22B65FED8(&qword_255BA4C38, (uint64_t)&unk_22BAAE520);
  sub_22BA7DC94();
  sub_22B65FED8(&qword_255BA4C28, (uint64_t)&unk_22BAAE550);
  sub_22B65FED8(&qword_255BA4C30, (uint64_t)&unk_22BAAE4D8);
  sub_22BA7E1D4();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI26ChartGalleryViewController *v4;

  v4 = self;
  sub_22B65F100(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ChartGalleryViewController();
  v4 = v5.receiver;
  -[ChartGalleryViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  sub_22B65FED8(&qword_255BA4C28, (uint64_t)&unk_22BAAE550);
  sub_22B65FED8(&qword_255BA4C30, (uint64_t)&unk_22BAAE4D8);
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
  v10.super_class = (Class)type metadata accessor for ChartGalleryViewController();
  v2 = (char *)v10.receiver;
  -[ChartGalleryViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  v3 = *(char **)(*(_QWORD *)&v2[OBJC_IVAR____TtC9SeymourUI26ChartGalleryViewController_dataProvider]
                + OBJC_IVAR____TtC9SeymourUI24ChartGalleryDataProvider_page);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(_QWORD *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_22B47C120(v6, v7, v8, v9);

}

- (void)backButtonPressed
{
  _TtC9SeymourUI26ChartGalleryViewController *v2;
  _TtC9SeymourUI26ChartGalleryViewController *v3;
  id v4;
  _TtC9SeymourUI26ChartGalleryViewController *v5;
  _TtC9SeymourUI26ChartGalleryViewController *v6;

  v6 = self;
  v2 = (_TtC9SeymourUI26ChartGalleryViewController *)-[ChartGalleryViewController navigationController](v6, sel_navigationController);
  if (v2)
  {
    v3 = v2;
    v4 = -[ChartGalleryViewController popViewControllerAnimated:](v2, sel_popViewControllerAnimated_, 1);

    v5 = v3;
  }
  else
  {
    v5 = v6;
  }

}

- (_TtC9SeymourUI26ChartGalleryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI26ChartGalleryViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI26ChartGalleryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI26ChartGalleryViewController_metricPageCategory;
  v4 = sub_22BA7B3CC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26ChartGalleryViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26ChartGalleryViewController_serviceSubscriptionCache);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26ChartGalleryViewController_storefrontLocalizer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26ChartGalleryViewController_upNextQueueButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26ChartGalleryViewController_standardNavigationBarTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26ChartGalleryViewController_currentNavigationBarTintColor));
}

@end

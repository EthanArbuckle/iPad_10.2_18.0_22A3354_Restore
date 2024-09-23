@implementation GuidedWorkoutGalleryViewController

- (void)viewDidLoad
{
  _TtC9SeymourUI34GuidedWorkoutGalleryViewController *v2;

  v2 = self;
  sub_22B2D5AF0();

}

- (_TtC9SeymourUI34GuidedWorkoutGalleryViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B2D71A4();
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9SeymourUI34GuidedWorkoutGalleryViewController *v4;

  v4 = self;
  sub_22B2D5D2C(a3);

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
  v7.super_class = (Class)type metadata accessor for GuidedWorkoutGalleryViewController();
  v4 = (char *)v7.receiver;
  -[GuidedWorkoutGalleryViewController viewIsAppearing:](&v7, sel_viewIsAppearing_, v3);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)&v4[OBJC_IVAR____TtC9SeymourUI34GuidedWorkoutGalleryViewController_dataProvider]+ OBJC_IVAR____TtC9SeymourUI32GuidedWorkoutGalleryDataProvider_page)+ OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView), sel_contentOffset, v7.receiver, v7.super_class);
  sub_22B8543E8(v5, v6);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for GuidedWorkoutGalleryViewController();
  v4 = v5.receiver;
  -[GuidedWorkoutGalleryViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_22B2D7164(&qword_255B8D5D0, (uint64_t)&unk_22BA97D68);
  sub_22BA7DC94();
  sub_22B2D7164(&qword_255B8D5C0, (uint64_t)&unk_22BA97D98);
  sub_22B2D7164(&qword_255B8D5C8, (uint64_t)&unk_22BA97D20);
  sub_22BA7E1D4();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI34GuidedWorkoutGalleryViewController *v4;

  v4 = self;
  sub_22B2D6300(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for GuidedWorkoutGalleryViewController();
  v4 = v5.receiver;
  -[GuidedWorkoutGalleryViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  sub_22B2D7164(&qword_255B8D5C0, (uint64_t)&unk_22BA97D98);
  sub_22B2D7164(&qword_255B8D5C8, (uint64_t)&unk_22BA97D20);
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
  v10.super_class = (Class)type metadata accessor for GuidedWorkoutGalleryViewController();
  v2 = (char *)v10.receiver;
  -[GuidedWorkoutGalleryViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  v3 = *(char **)(*(_QWORD *)&v2[OBJC_IVAR____TtC9SeymourUI34GuidedWorkoutGalleryViewController_dataProvider]
                + OBJC_IVAR____TtC9SeymourUI32GuidedWorkoutGalleryDataProvider_page);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(_QWORD *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_22B47C120(v6, v7, v8, v9);

}

- (void)handleBackButtonTap
{
  _TtC9SeymourUI34GuidedWorkoutGalleryViewController *v2;
  _TtC9SeymourUI34GuidedWorkoutGalleryViewController *v3;
  id v4;
  _TtC9SeymourUI34GuidedWorkoutGalleryViewController *v5;
  _TtC9SeymourUI34GuidedWorkoutGalleryViewController *v6;

  v6 = self;
  v2 = (_TtC9SeymourUI34GuidedWorkoutGalleryViewController *)-[GuidedWorkoutGalleryViewController navigationController](v6, sel_navigationController);
  if (v2)
  {
    v3 = v2;
    v4 = -[GuidedWorkoutGalleryViewController popViewControllerAnimated:](v2, sel_popViewControllerAnimated_, 1);

    v5 = v3;
  }
  else
  {
    v5 = v6;
  }

}

- (_TtC9SeymourUI34GuidedWorkoutGalleryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI34GuidedWorkoutGalleryViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI34GuidedWorkoutGalleryViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI34GuidedWorkoutGalleryViewController_metricPageCategory;
  v4 = sub_22BA7B3CC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34GuidedWorkoutGalleryViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34GuidedWorkoutGalleryViewController_serviceSubscriptionCache);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34GuidedWorkoutGalleryViewController_storefrontLocalizer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34GuidedWorkoutGalleryViewController_upNextQueueButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34GuidedWorkoutGalleryViewController_standardNavigationBarTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34GuidedWorkoutGalleryViewController_currentNavigationBarTintColor));
}

@end

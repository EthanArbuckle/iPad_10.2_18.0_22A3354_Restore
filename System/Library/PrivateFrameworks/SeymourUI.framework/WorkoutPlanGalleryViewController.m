@implementation WorkoutPlanGalleryViewController

- (_TtC9SeymourUI32WorkoutPlanGalleryViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B67A110();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI32WorkoutPlanGalleryViewController *v2;

  v2 = self;
  sub_22B679188();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = v9.receiver;
  -[WorkoutPlanGalleryViewController viewWillAppear:](&v9, sel_viewWillAppear_, v3);
  v5 = objc_msgSend(v4, sel_navigationController, v9.receiver, v9.super_class);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, sel_navigationBar);

    v8 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
    objc_msgSend(v7, sel_setTintColor_, v8);

    v4 = v8;
  }

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
  -[WorkoutPlanGalleryViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_22B67A0D4((unint64_t *)&unk_255BA5860, (uint64_t)&unk_22BAAF160);
  sub_22BA7DC94();
  sub_22B67A0D4((unint64_t *)&unk_255BA5840, (uint64_t)&unk_22BAAF190);
  sub_22B67A0D4((unint64_t *)&unk_255BA5850, (uint64_t)&unk_22BAAF118);
  sub_22BA7E1D4();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI32WorkoutPlanGalleryViewController *v4;

  v4 = self;
  sub_22B6794AC(a3);

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
  -[WorkoutPlanGalleryViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  sub_22B67A0D4((unint64_t *)&unk_255BA5840, (uint64_t)&unk_22BAAF190);
  sub_22B67A0D4((unint64_t *)&unk_255BA5850, (uint64_t)&unk_22BAAF118);
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
  -[WorkoutPlanGalleryViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  v3 = *(char **)(*(_QWORD *)&v2[OBJC_IVAR____TtC9SeymourUI32WorkoutPlanGalleryViewController_dataProvider]
                + OBJC_IVAR____TtC9SeymourUI30WorkoutPlanGalleryDataProvider_page);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(_QWORD *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_22B47C120(v6, v7, v8, v9);

}

- (_TtC9SeymourUI32WorkoutPlanGalleryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI32WorkoutPlanGalleryViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI32WorkoutPlanGalleryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32WorkoutPlanGalleryViewController_dynamicOfferCoordinator));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI32WorkoutPlanGalleryViewController_pageNavigator);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32WorkoutPlanGalleryViewController_purchaseCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32WorkoutPlanGalleryViewController_purchaseHandler));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI32WorkoutPlanGalleryViewController_storefrontLocalizer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32WorkoutPlanGalleryViewController_webUserInterfaceCoordinator));
  swift_unknownObjectRelease();
}

@end

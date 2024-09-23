@implementation UpNextQueueViewController

- (unint64_t)supportedInterfaceOrientations
{
  if (*((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_platform) == 1)
    return 30;
  else
    return 2;
}

- (void)viewDidLoad
{
  _TtC9SeymourUI25UpNextQueueViewController *v2;

  v2 = self;
  UpNextQueueViewController.viewDidLoad()();

}

- (_TtC9SeymourUI25UpNextQueueViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B65D49C();
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
  -[UpNextQueueViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_22B65D764(&qword_255BA49C8, (uint64_t)&protocol conformance descriptor for UpNextQueueViewController);
  sub_22BA7DC94();
  sub_22B65D764(&qword_255BA49D0, (uint64_t)&protocol conformance descriptor for UpNextQueueViewController);
  sub_22B65D764(qword_255BA49D8, (uint64_t)&protocol conformance descriptor for UpNextQueueViewController);
  sub_22BA7E1D4();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9SeymourUI25UpNextQueueViewController *v4;

  v4 = self;
  UpNextQueueViewController.viewWillAppear(_:)(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC9SeymourUI25UpNextQueueViewController *v10;
  _QWORD v11[2];
  objc_super v12;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = sub_22BA799A4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = self;
  -[UpNextQueueViewController viewWillDisappear:](&v12, sel_viewWillDisappear_, v3);
  v11[1] = v10;
  sub_22BA79998();
  sub_22B65D764(&qword_255BA49D0, (uint64_t)&protocol conformance descriptor for UpNextQueueViewController);
  sub_22BA7E114();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

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
  -[UpNextQueueViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  sub_22B65D764(&qword_255BA49D0, (uint64_t)&protocol conformance descriptor for UpNextQueueViewController);
  sub_22B65D764(qword_255BA49D8, (uint64_t)&protocol conformance descriptor for UpNextQueueViewController);
  sub_22BA7E1E0();

}

- (void)viewWillLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[UpNextQueueViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  sub_22B658F1C();

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
  -[UpNextQueueViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  v3 = *(char **)(*(_QWORD *)&v2[OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_dataProvider]
                + OBJC_IVAR____TtC9SeymourUI30UpNextQueueGalleryDataProvider_page);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(_QWORD *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_22B47C120(v6, v7, v8, v9);

}

- (void)dismissView
{
  -[UpNextQueueViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (_TtC9SeymourUI25UpNextQueueViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI25UpNextQueueViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI25UpNextQueueViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_bookmarkClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_contentAvailabilityFilter);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_storefrontLocalizer);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_subscriptionCache);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_upNextQueueClient);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_queueActionsView));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_mediaTagStringBuilder);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_blurView));
  objc_release(*(id *)((char *)&self->super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_layout));
  swift_bridgeObjectRelease();
}

@end

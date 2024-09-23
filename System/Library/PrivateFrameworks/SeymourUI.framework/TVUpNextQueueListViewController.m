@implementation TVUpNextQueueListViewController

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255B84960);
  v3 = swift_allocObject();
  v4 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI31TVUpNextQueueListViewController_dataProvider);
  *(_OWORD *)(v3 + 16) = xmmword_22BA90150;
  v5 = *(void **)(*(_QWORD *)(v4 + OBJC_IVAR____TtC9SeymourUI29TVUpNextQueueListDataProvider_page)
                + OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView);
  *(_QWORD *)(v3 + 32) = v5;
  sub_22BA808D4();
  v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v7 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v7;
}

- (_TtC9SeymourUI31TVUpNextQueueListViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B495D18();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI31TVUpNextQueueListViewController *v2;

  v2 = self;
  sub_22B494C14();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVUpNextQueueListViewController();
  v4 = v5.receiver;
  -[TVUpNextQueueListViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_22B495CD8(&qword_255B999A0, (uint64_t)&unk_22BAA4168);
  sub_22BA7DC94();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  objc_class *QueueListViewController;
  _TtC9SeymourUI31TVUpNextQueueListViewController *v10;
  _QWORD v11[2];
  objc_super v12;

  v3 = a3;
  v5 = sub_22BA799A4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  QueueListViewController = (objc_class *)type metadata accessor for TVUpNextQueueListViewController();
  v12.receiver = self;
  v12.super_class = QueueListViewController;
  v10 = self;
  -[TVUpNextQueueListViewController viewWillDisappear:](&v12, sel_viewWillDisappear_, v3);
  v11[1] = v10;
  sub_22BA79998();
  sub_22B495CD8(&qword_255B99998, (uint64_t)&unk_22BAA4198);
  sub_22BA7E114();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

}

- (void)viewWillLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TVUpNextQueueListViewController();
  v2 = v3.receiver;
  -[TVUpNextQueueListViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  sub_22B2ABF38(0);

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
  v10.super_class = (Class)type metadata accessor for TVUpNextQueueListViewController();
  v2 = (char *)v10.receiver;
  -[TVUpNextQueueListViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  v3 = *(char **)(*(_QWORD *)&v2[OBJC_IVAR____TtC9SeymourUI31TVUpNextQueueListViewController_dataProvider]
                + OBJC_IVAR____TtC9SeymourUI29TVUpNextQueueListDataProvider_page);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(_QWORD *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_22B47C120(v6, v7, v8, v9);

}

- (void)handleBackButtonPressed:(id)a3
{
  id v4;
  _TtC9SeymourUI31TVUpNextQueueListViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22B336724();

}

- (_TtC9SeymourUI31TVUpNextQueueListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI31TVUpNextQueueListViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI31TVUpNextQueueListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI31TVUpNextQueueListViewController_dataProvider));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI31TVUpNextQueueListViewController_pageNavigator);
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI31TVUpNextQueueListViewController_dynamicOfferCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI31TVUpNextQueueListViewController_purchaseCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI31TVUpNextQueueListViewController_purchaseHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI31TVUpNextQueueListViewController_webUserInterfaceCoordinator));
  swift_unknownObjectRelease();
  sub_22B18BA1C((uint64_t)self + OBJC_IVAR____TtC9SeymourUI31TVUpNextQueueListViewController_lastFocusedIndexPath);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI31TVUpNextQueueListViewController_timerProvider);
}

@end

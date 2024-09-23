@implementation TVPlaylistListViewController

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
                              + OBJC_IVAR____TtC9SeymourUI28TVPlaylistListViewController_dataProvider))[4]
                + OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView);
  *(_QWORD *)(v3 + 32) = v4;
  sub_22BA808D4();
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v6 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (_TtC9SeymourUI28TVPlaylistListViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC9SeymourUI28TVPlaylistListViewController *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI28TVPlaylistListViewController_visibility) = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI28TVPlaylistListViewController_resignActiveObserver) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI28TVPlaylistListViewController_lastFocusedIndexPath;
  v6 = sub_22BA79C14();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI28TVPlaylistListViewController_settlingTimer) = 0;
  v7 = a3;

  result = (_TtC9SeymourUI28TVPlaylistListViewController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC9SeymourUI28TVPlaylistListViewController *v2;

  v2 = self;
  sub_22B85155C();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVPlaylistListViewController();
  v4 = v5.receiver;
  -[TVPlaylistListViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_22B851F84(&qword_255BAF840, (uint64_t)&unk_22BAB90B0);
  sub_22BA7DC94();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  objc_class *v9;
  _TtC9SeymourUI28TVPlaylistListViewController *v10;
  _QWORD v11[2];
  objc_super v12;

  v3 = a3;
  v5 = sub_22BA799A4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (objc_class *)type metadata accessor for TVPlaylistListViewController();
  v12.receiver = self;
  v12.super_class = v9;
  v10 = self;
  -[TVPlaylistListViewController viewWillDisappear:](&v12, sel_viewWillDisappear_, v3);
  v11[1] = v10;
  sub_22BA79998();
  sub_22B851F84(&qword_255BAF838, (uint64_t)&unk_22BAB9068);
  sub_22BA7E114();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

}

- (void)viewWillLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TVPlaylistListViewController();
  v2 = v3.receiver;
  -[TVPlaylistListViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  sub_22B2AC848(0);

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
  v10.super_class = (Class)type metadata accessor for TVPlaylistListViewController();
  v2 = (char *)v10.receiver;
  -[TVPlaylistListViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  v3 = *(char **)(*(_QWORD *)&v2[OBJC_IVAR____TtC9SeymourUI28TVPlaylistListViewController_dataProvider] + 32);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(_QWORD *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_22B47C120(v6, v7, v8, v9);

}

- (_TtC9SeymourUI28TVPlaylistListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI28TVPlaylistListViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI28TVPlaylistListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28TVPlaylistListViewController_pageNavigator);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_22B18BA1C((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28TVPlaylistListViewController_lastFocusedIndexPath);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28TVPlaylistListViewController_timerProvider);
}

@end

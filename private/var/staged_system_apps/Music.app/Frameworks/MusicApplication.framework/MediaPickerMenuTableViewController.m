@implementation MediaPickerMenuTableViewController

- (_TtC16MusicApplication34MediaPickerMenuTableViewController)init
{
  return -[MediaPickerMenuTableViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
}

- (_TtC16MusicApplication34MediaPickerMenuTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  char *v9;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  v9 = sub_8EF888(v5, v7, (uint64_t)a4);

  return (_TtC16MusicApplication34MediaPickerMenuTableViewController *)v9;
}

- (_TtC16MusicApplication34MediaPickerMenuTableViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplication34MediaPickerMenuTableViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication34MediaPickerMenuTableViewController_bindings) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication34MediaPickerMenuTableViewController_menuItems) = (Class)_swiftEmptyArrayStorage;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplication34MediaPickerMenuTableViewController_needsVisibleMenuItemsUpdate) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplication34MediaPickerMenuTableViewController_isBatchUpdating) = 0;
  v4 = a3;

  result = (_TtC16MusicApplication34MediaPickerMenuTableViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/MediaPickerMenuTableViewController.swift", 57, 2, 36, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC16MusicApplication34MediaPickerMenuTableViewController *v2;

  v2 = self;
  sub_8EE228();

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(_QWORD **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication34MediaPickerMenuTableViewController_menuItems))[2];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication34MediaPickerMenuTableViewController *v13;
  __n128 v14;
  void *v15;
  void *v16;
  uint64_t v18;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_8EE6FC(v11, v14);
  v16 = v15;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v16;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication34MediaPickerMenuTableViewController *v13;
  __n128 v14;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_8EFAC4(v14);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v11 = type metadata accessor for LibraryMenuViewController.Cell();
  v12 = (void *)swift_dynamicCastClass(a4, v11);
  v13 = a5;
  if (v12)
    objc_msgSend(v12, "_setDrawsSeparatorAtTopOfSection:", 0);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

}

- (_TtC16MusicApplication34MediaPickerMenuTableViewController)initWithStyle:(int64_t)a3
{
  _TtC16MusicApplication34MediaPickerMenuTableViewController *result;

  result = (_TtC16MusicApplication34MediaPickerMenuTableViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.MediaPickerMenuTableViewController", 51, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication34MediaPickerMenuTableViewController_bindings));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication34MediaPickerMenuTableViewController_menuItems));
}

@end

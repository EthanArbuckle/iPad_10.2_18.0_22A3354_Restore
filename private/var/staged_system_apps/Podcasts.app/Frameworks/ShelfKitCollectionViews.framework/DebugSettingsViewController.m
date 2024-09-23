@implementation DebugSettingsViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[DebugSettingsViewController viewWillAppear:](&v4, "viewWillAppear:", v3);
}

- (_TtC23ShelfKitCollectionViews27DebugSettingsViewController)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtC23ShelfKitCollectionViews27DebugSettingsViewController *result;

  v5 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews27DebugSettingsViewController_debugActionsProvider;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v6 = a3;

  result = (_TtC23ShelfKitCollectionViews27DebugSettingsViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/DebugSettingsViewController.swift", 57, 2, 413, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC23ShelfKitCollectionViews27DebugSettingsViewController *v2;

  v2 = self;
  DebugSettingsViewController.viewDidLoad()();

}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC23ShelfKitCollectionViews27DebugSettingsViewController *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void *)objc_opt_self(NSNotificationCenter);
  v5 = self;
  v6 = objc_msgSend(v4, "defaultCenter");
  objc_msgSend(v6, "removeObserver:", v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[DebugSettingsViewController dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews27DebugSettingsViewController_settings));
  sub_10DBC8((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews27DebugSettingsViewController_debugActionsProvider);
}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC23ShelfKitCollectionViews27DebugSettingsViewController *v2;
  id v3;
  char *v4;

  v2 = self;
  v3 = -[DebugSettingsViewController traitCollection](v2, "traitCollection");
  v4 = (char *)objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (_BYTE *)&dword_0 + 1)
    return 30;
  else
    return 2;
}

- (void)userDefaultsDidChange:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews27DebugSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_28D5A0();

}

- (void)takeNewBoolValueFrom:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews27DebugSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_28AB98(v4);

}

- (void)dismissFrom:(id)a3
{
  -[DebugSettingsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  char *v3;
  _BYTE v5[24];

  v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews27DebugSettingsViewController_settings;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews27DebugSettingsViewController_settings, v5, 0, 0);
  return *(_QWORD *)(*(_QWORD *)v3 + 16);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  char *v5;
  int64_t result;
  _BYTE v7[24];

  v5 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews27DebugSettingsViewController_settings;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews27DebugSettingsViewController_settings, v7, 0, 0);
  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(*(_QWORD *)v5 + 16) > (unint64_t)a4)
  {
    return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 40 * a4 + 64) + 16);
  }
  __break(1u);
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  char *v5;
  id result;
  uint64_t v7;
  NSString v8;
  _BYTE v9[24];

  v5 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews27DebugSettingsViewController_settings;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews27DebugSettingsViewController_settings, v9, 0, 0);
  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(*(_QWORD *)v5 + 16) > (unint64_t)a4)
  {
    v7 = *(_QWORD *)(*(_QWORD *)v5 + 40 * a4 + 40);
    swift_bridgeObjectRetain(v7);
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
    return v8;
  }
  __break(1u);
  return result;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  char *v5;
  id result;
  uint64_t v7;
  NSString v8;
  _BYTE v9[24];

  v5 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews27DebugSettingsViewController_settings;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews27DebugSettingsViewController_settings, v9, 0, 0);
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (*(_QWORD *)(*(_QWORD *)v5 + 16) <= (unint64_t)a4)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  v7 = *(_QWORD *)(*(_QWORD *)v5 + 40 * a4 + 56);
  if (v7)
  {
    swift_bridgeObjectRetain(v7);
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC23ShelfKitCollectionViews27DebugSettingsViewController *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  DebugSettingsViewController.tableView(_:cellForRowAt:)(v11);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC23ShelfKitCollectionViews27DebugSettingsViewController *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_28D778(v14);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC23ShelfKitCollectionViews27DebugSettingsViewController *v15;
  void (*v16)(char *, uint64_t);
  Class isa;
  uint64_t v19;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_3D1A00);
  __chkstk_darwin(v11);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = a3;
  v15 = self;
  DebugSettingsViewController.tableView(_:willSelectRowAt:)((uint64_t)v15, (uint64_t)v10, (uint64_t)v13);

  v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v10, v7);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v13, 1, v7) != 1)
  {
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    v16(v13, v7);
  }
  return isa;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC23ShelfKitCollectionViews27DebugSettingsViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  DebugSettingsViewController.tableView(_:didSelectRowAt:)(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC23ShelfKitCollectionViews27DebugSettingsViewController)initWithStyle:(int64_t)a3
{
  _TtC23ShelfKitCollectionViews27DebugSettingsViewController *result;

  result = (_TtC23ShelfKitCollectionViews27DebugSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.DebugSettingsViewController", 51, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (_TtC23ShelfKitCollectionViews27DebugSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC23ShelfKitCollectionViews27DebugSettingsViewController *result;

  v4 = a4;
  result = (_TtC23ShelfKitCollectionViews27DebugSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.DebugSettingsViewController", 51, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

@end

@implementation TTRIGroupMembershipViewController

- (_TtC9Reminders33TTRIGroupMembershipViewController)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC9Reminders33TTRIGroupMembershipViewController *)sub_100054108(v3, v4);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                  + OBJC_IVAR____TtC9Reminders33TTRIGroupMembershipViewController_localUndoManager));
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v7.receiver;
  -[TTRIGroupMembershipViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = objc_msgSend(v2, "tableView", v7.receiver, v7.super_class);
  if (v3)
  {
    v4 = v3;
    UITableView.fixUpBackgroundColorLoadedFromNibIfNeeded_workaroundRdar108920406()();

    v5 = objc_msgSend(v2, "tableView");
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "setEditing:animated:", 1, 0);

      sub_10005422C();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  v4 = v5.receiver;
  -[TTRIGroupMembershipViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  objc_msgSend(v4, "becomeFirstResponder", v5.receiver, v5.super_class);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC9Reminders33TTRIGroupMembershipViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_100056B90(a4);

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  _TtC9Reminders33TTRIGroupMembershipViewController *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_100056C4C();

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC9Reminders33TTRIGroupMembershipViewController *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_100054D70(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC9Reminders33TTRIGroupMembershipViewController *v13;
  uint64_t v14;
  __int128 v15;
  char v16;
  uint64_t v17;
  id v18[2];
  __int128 v19;

  v8 = type metadata accessor for IndexPath(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v12 = a3;
  v13 = self;
  sub_100054678((uint64_t)v11, &v15);
  if ((v16 & 1) != 0)
    sub_1003F40E0(&v15);
  else
    sub_1003F3DB0(&v15);
  v19 = v15;
  sub_100056AB8((uint64_t)&v19);
  sub_100056AE0((uint64_t)&v17, (uint64_t)v18);
  sub_100037F50(v18);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC9Reminders33TTRIGroupMembershipViewController *v12;
  int64_t v13;
  uint64_t v15;
  __int128 v16;
  char v17;
  uint64_t v18;
  id v19[2];
  __int128 v20;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100054678((uint64_t)v10, &v16);
  v20 = v16;
  sub_100056AB8((uint64_t)&v20);
  sub_100056AE0((uint64_t)&v18, (uint64_t)v19);
  sub_100037F50(v19);

  if ((v17 & 1) != 0)
    v13 = 1;
  else
    v13 = 2;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC9Reminders33TTRIGroupMembershipViewController *v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;

  v6 = a3;
  v7 = self;
  sub_100056CF0(a4);
  v9 = v8;

  if (v9)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC9Reminders33TTRIGroupMembershipViewController *v12;
  Swift::String v13;
  Swift::String v14;
  void *object;
  NSString v16;
  uint64_t v18;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13._object = (void *)0x800000010055FE60;
  v14._countAndFlagsBits = 0x65766F6D6552;
  v14._object = (void *)0xE600000000000000;
  v13._countAndFlagsBits = 0xD00000000000002CLL;
  object = TTRLocalizedString(_:comment:)(v14, v13)._object;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  return v16;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC9Reminders33TTRIGroupMembershipViewController *v12;
  char v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100056F00();
  LOBYTE(self) = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  _TtC9Reminders33TTRIGroupMembershipViewController *v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v19 - v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = self;
  sub_1000570C8((uint64_t)v15);

  v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v13, v9);
  v18(v15, v9);
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  id v21;
  _TtC9Reminders33TTRIGroupMembershipViewController *v22;
  uint64_t v23;
  char *v24;
  void (*v25)(char *, uint64_t);
  Class isa;
  id result;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char *v33;
  _BYTE v34[40];
  char v35[8];
  uint64_t v36;

  v32 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v32 - 8);
  __chkstk_darwin(v32);
  v33 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for IndexPath(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v13);
  v18 = (char *)&v32 - v17;
  __chkstk_darwin(v16);
  v20 = (char *)&v32 - v19;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v21 = a3;
  v22 = self;
  v23 = IndexPath.section.getter(v22);
  sub_100054560(v23, (uint64_t)v34);
  sub_100056B1C((uint64_t)v34, (uint64_t)v35);
  v24 = v15;
  if (v36 && (v24 = v18, v36 != 1))
  {
    if (qword_10063D2C8 != -1)
      swift_once(&qword_10063D2C8, sub_100054078);
    v28 = v32;
    v29 = sub_100012DC4(v32, (uint64_t)qword_10063F898);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v33, v29, v28);
    v30 = sub_10002D32C((uint64_t)_swiftEmptyArrayStorage);
    v31 = sub_10002D32C((uint64_t)_swiftEmptyArrayStorage);
    sub_1002EB23C((uint64_t)"Unexpected item", 15, 2uLL, v30, v31);
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v20, v24, v11);

    v25 = *(void (**)(char *, uint64_t))(v12 + 8);
    v25(v15, v11);
    v25(v18, v11);
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    v25(v20, v11);
    return isa;
  }
  return result;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _TtC9Reminders33TTRIGroupMembershipViewController *v11;
  _TtC9Reminders33TTRIGroupMembershipViewController *v12;
  _TtC9Reminders33TTRIGroupMembershipViewController *v13;
  _TtC9Reminders33TTRIGroupMembershipViewController *v14;
  _TtC9Reminders33TTRIGroupMembershipViewController *v15;

  v8 = objc_opt_self(UITableViewHeaderFooterView);
  v9 = swift_dynamicCastObjCClass(a4, v8);
  if (v9)
  {
    v10 = (void *)v9;
    v11 = (_TtC9Reminders33TTRIGroupMembershipViewController *)a3;
    v12 = (_TtC9Reminders33TTRIGroupMembershipViewController *)a4;
    v15 = self;
    v13 = (_TtC9Reminders33TTRIGroupMembershipViewController *)objc_msgSend(v10, "textLabel");
    if (v13)
    {
      v14 = v13;
      sub_100005ED8(0, &qword_10063F908, UILabel_ptr);
      TTRIFontCustomizable.replaceFontWithRounded()();

      v11 = v12;
      v12 = v15;
      v15 = v14;
    }

  }
}

- (_TtC9Reminders33TTRIGroupMembershipViewController)initWithStyle:(int64_t)a3
{
  _TtC9Reminders33TTRIGroupMembershipViewController *result;

  result = (_TtC9Reminders33TTRIGroupMembershipViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIGroupMembershipViewController", 43, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (_TtC9Reminders33TTRIGroupMembershipViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9Reminders33TTRIGroupMembershipViewController *result;

  v4 = a4;
  result = (_TtC9Reminders33TTRIGroupMembershipViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIGroupMembershipViewController", 43, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC9Reminders33TTRIGroupMembershipViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders33TTRIGroupMembershipViewController_localUndoManager));
  sub_1000569E4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC9Reminders33TTRIGroupMembershipViewController_viewModel), *(_QWORD *)&self->presenter[OBJC_IVAR____TtC9Reminders33TTRIGroupMembershipViewController_viewModel]);
}

@end

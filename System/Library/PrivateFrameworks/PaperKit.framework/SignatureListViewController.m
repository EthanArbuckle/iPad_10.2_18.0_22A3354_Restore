@implementation SignatureListViewController

- (_TtC8PaperKit27SignatureListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC8PaperKit27SignatureListViewController *)SignatureListViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC8PaperKit27SignatureListViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC8PaperKit27SignatureListViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit27SignatureListViewController_rowHeight) = (Class)0x4055800000000000;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit27SignatureListViewController_maximumSelectRows) = (Class)3;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit27SignatureListViewController_maximumEditRows) = (Class)4;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit27SignatureListViewController_signatureRowHeight) = (Class)0x4055800000000000;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit27SignatureListViewController_showDescriptions) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8PaperKit27SignatureListViewController_completion);
  *v4 = UnknownCanvasElementView.flags.modify;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC8PaperKit27SignatureListViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC8PaperKit27SignatureListViewController *v7;
  unint64_t v8;
  int64_t v9;

  type metadata accessor for SignatureManager();
  v6 = a3;
  v7 = self;
  swift_initStaticObject();
  v8 = SignatureManager.signatureItems.getter();
  if (v8 >> 62)
    v9 = _CocoaArrayWrapper.endIndex.getter();
  else
    v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);

  swift_bridgeObjectRelease();
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8PaperKit27SignatureListViewController *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v6 = type metadata accessor for IndexPath();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = a3;
  v12 = self;
  SignatureListViewController.tableView(_:cellForRowAt:)(v11);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v14;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC8PaperKit27SignatureListViewController *v15;
  uint64_t v16;

  v8 = type metadata accessor for IndexPath();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = a3;
  v14 = a4;
  v15 = self;
  specialized SignatureListViewController.tableView(_:willDisplay:forRowAt:)(v14);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int64_t v10;
  uint64_t v12;

  v5 = type metadata accessor for IndexPath();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = objc_msgSend(a3, sel_isEditing);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return v10;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC8PaperKit27SignatureListViewController *v14;
  uint64_t v15;

  v8 = type metadata accessor for IndexPath();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = a3;
  v14 = self;
  specialized SignatureListViewController.tableView(_:commit:forRowAt:)(v13, a4, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8PaperKit27SignatureListViewController *v12;
  uint64_t v13;

  v6 = type metadata accessor for IndexPath();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = a3;
  v12 = self;
  SignatureListViewController.tableView(_:didSelectRowAt:)(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (_TtC8PaperKit27SignatureListViewController)initWithStyle:(int64_t)a3
{
  _TtC8PaperKit27SignatureListViewController *result;

  result = (_TtC8PaperKit27SignatureListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end

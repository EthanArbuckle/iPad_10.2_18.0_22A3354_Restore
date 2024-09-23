@implementation FMPredefinedMessageViewController

- (void)updateViewConstraints
{
  char *v2;
  void *v3;
  id v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMPredefinedMessageViewController();
  v2 = (char *)v6.receiver;
  -[FMPredefinedMessageViewController updateViewConstraints](&v6, "updateViewConstraints");
  v3 = *(void **)&v2[OBJC_IVAR____TtC6FindMy33FMPredefinedMessageViewController_tableView];
  v4 = *(id *)&v2[OBJC_IVAR____TtC6FindMy33FMPredefinedMessageViewController_tableViewheightConstraint];
  objc_msgSend(v3, "intrinsicContentSize", v6.receiver, v6.super_class);
  objc_msgSend(v4, "setConstant:", v5);

}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMPredefinedMessageViewController();
  v2 = v3.receiver;
  -[FMPredefinedMessageViewController viewDidLoad](&v3, "viewDidLoad");
  sub_1003CDB08();
  sub_1003CDD60();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC6FindMy33FMPredefinedMessageViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003CED04();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return *(_QWORD *)(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy33FMPredefinedMessageViewController_messages]
                   + 16);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC6FindMy33FMPredefinedMessageViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_1003CE1B0(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
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
  _TtC6FindMy33FMPredefinedMessageViewController *v15;
  void (*v16)(char *, uint64_t);
  Class isa;
  uint64_t v19;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100053F2C(&qword_1005D33C0);
  __chkstk_darwin(v11);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = a3;
  v15 = self;
  sub_1003CE454(v14, (uint64_t)v10, v13);

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
  _TtC6FindMy33FMPredefinedMessageViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1003CE944(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC6FindMy33FMPredefinedMessageViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC6FindMy33FMPredefinedMessageViewController *result;

  result = (_TtC6FindMy33FMPredefinedMessageViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMPredefinedMessageViewController", 40, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC6FindMy33FMPredefinedMessageViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC6FindMy33FMPredefinedMessageViewController *result;

  v6 = a5;
  result = (_TtC6FindMy33FMPredefinedMessageViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMPredefinedMessageViewController", 40, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy33FMPredefinedMessageViewController_mediator]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->mediator[OBJC_IVAR____TtC6FindMy33FMPredefinedMessageViewController_passcode]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->mediator[OBJC_IVAR____TtC6FindMy33FMPredefinedMessageViewController_phoneNumber]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy33FMPredefinedMessageViewController_messages]);
}

@end

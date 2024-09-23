@implementation FMEditableMessageViewController

- (void)viewDidLoad
{
  _QWORD *v2;
  id v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMEditableMessageViewController();
  v2 = v5.receiver;
  v3 = -[FMEditableMessageViewController viewDidLoad](&v5, "viewDidLoad");
  v4 = (*(uint64_t (**)(id))((swift_isaMask & *v2) + 0x188))(v3);
  (*(void (**)(uint64_t))((swift_isaMask & *v2) + 0x190))(v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMEditableMessageViewController();
  v4 = v5.receiver;
  -[FMEditableMessageViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  sub_100212F34();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMEditableMessageViewController();
  v4 = v6.receiver;
  -[FMEditableMessageViewController viewWillDisappear:](&v6, "viewWillDisappear:", v3);
  v5 = sub_1002124FC();
  objc_msgSend(v5, "resignFirstResponder", v6.receiver, v6.super_class);

  sub_100213190();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC6FindMy31FMEditableMessageViewController *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_1002122F4(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5;
  _TtC6FindMy31FMEditableMessageViewController *v6;
  char *v7;

  v5 = a3;
  v6 = self;
  v7 = sub_100213E7C();

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  _TtC6FindMy31FMEditableMessageViewController *v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  uint64_t v20;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = qword_1005D1EA8;
  v12 = a3;
  v13 = self;
  if (v11 != -1)
    swift_once(&qword_1005D1EA8, sub_1002FF56C);
  v14 = *(double *)&qword_1005F5A38;
  v15 = *(double *)&qword_1005F5A40;
  v16 = objc_msgSend((id)objc_opt_self(UIFont), "preferredFontForTextStyle:", qword_1005F5A30);
  objc_msgSend(v16, "lineHeight");
  v18 = v17;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15 + v15 + v14 * v18;
}

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtC6FindMy31FMEditableMessageViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100212468(v4);

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  _TtC6FindMy31FMEditableMessageViewController *v12;
  uint64_t v13;

  length = a4.length;
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v10 = v9;
  v11 = a3;
  v12 = self;
  LOBYTE(length) = sub_100212604(v8, v10, v13, length, 0);

  swift_bridgeObjectRelease(v10);
  return length & 1;
}

- (_TtC6FindMy31FMEditableMessageViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC6FindMy31FMEditableMessageViewController *result;

  result = (_TtC6FindMy31FMEditableMessageViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMEditableMessageViewController", 38, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC6FindMy31FMEditableMessageViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC6FindMy31FMEditableMessageViewController *result;

  v6 = a5;
  result = (_TtC6FindMy31FMEditableMessageViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMEditableMessageViewController", 38, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy31FMEditableMessageViewController_mediator]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->mediator[OBJC_IVAR____TtC6FindMy31FMEditableMessageViewController_passcode]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->mediator[OBJC_IVAR____TtC6FindMy31FMEditableMessageViewController_phoneNumber]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->mediator[OBJC_IVAR____TtC6FindMy31FMEditableMessageViewController_message]);
  swift_unknownObjectRelease(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy31FMEditableMessageViewController_keyboardWillShowObserver]);
  swift_unknownObjectRelease(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy31FMEditableMessageViewController_keyboardWillHideObserver]);

}

@end

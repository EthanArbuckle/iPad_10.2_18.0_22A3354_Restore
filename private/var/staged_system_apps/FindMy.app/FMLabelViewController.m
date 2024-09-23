@implementation FMLabelViewController

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double result;

  result = 0.0;
  if (!a4)
    return *(double *)&self->mediator[OBJC_IVAR____TtC6FindMy21FMLabelViewController_style];
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC6FindMy21FMLabelViewController *v7;
  int64_t v8;
  int64_t v9;

  v6 = a3;
  v7 = self;
  sub_100233D40(a4);
  v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC6FindMy21FMLabelViewController *v12;
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
  sub_10023060C(v11, (uint64_t)v10);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  LOBYTE(a4) = IndexPath.section.getter(v9) == 1;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (char)a4;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC6FindMy21FMLabelViewController *v14;
  uint64_t v15;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = self;
  sub_100233DD4(a4, (uint64_t)v12);

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
  _TtC6FindMy21FMLabelViewController *v15;
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
  sub_100232AAC((uint64_t)v10, (uint64_t)v13);

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
  _TtC6FindMy21FMLabelViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100233778(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC6FindMy21FMLabelViewController *v12;
  int64_t v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_1002342E0((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (_TtC6FindMy21FMLabelViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10033E2B0();
}

- (void)viewDidLoad
{
  _TtC6FindMy21FMLabelViewController *v2;

  v2 = self;
  sub_1003383CC();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy21FMLabelViewController *v4;

  v4 = self;
  sub_100338A28(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy21FMLabelViewController *v4;

  v4 = self;
  sub_100338F5C(a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC6FindMy21FMLabelViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1003392DC(a3);

}

- (void)toggleEditingActionWithSender:(id)a3
{
  id v4;
  _TtC6FindMy21FMLabelViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10033E51C();

}

- (void)completeEditingTableViewCellTextActionWithSender:(id)a3
{
  uint64_t v3;
  void *v4;
  id v6;
  _TtC6FindMy21FMLabelViewController *v7;
  _BYTE *v8;
  id v9;

  v3 = OBJC_IVAR____TtC6FindMy21FMLabelViewController_editingTableViewCellText;
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC6FindMy21FMLabelViewController_editingTableViewCellText);
  if (v4)
  {
    v6 = a3;
    v7 = self;
    v8 = v4;
    sub_10033B680(v8);
    v9 = *(Class *)((char *)&self->super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.isa + v3) = 0;

  }
}

- (void)performCancelActionWithSender:(id)a3
{
  void *v5;
  id v6;
  _TtC6FindMy21FMLabelViewController *v7;
  _QWORD v8[6];

  v8[4] = State.rawValue.getter;
  v8[5] = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_100037DF8;
  v8[3] = &unk_10055BA10;
  v5 = _Block_copy(v8);
  v6 = a3;
  v7 = self;
  -[FMLabelViewController dismissViewControllerAnimated:completion:](v7, "dismissViewControllerAnimated:completion:", 1, v5);
  _Block_release(v5);

}

- (_TtC6FindMy21FMLabelViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6FindMy21FMLabelViewController *result;

  v4 = a4;
  result = (_TtC6FindMy21FMLabelViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMLabelViewController", 28, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy21FMLabelViewController_mediator));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy21FMLabelViewController_peopleSubscription));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy21FMLabelViewController_conditionsSubscription));

  swift_bridgeObjectRelease(*(_QWORD *)&self->mediator[OBJC_IVAR____TtC6FindMy21FMLabelViewController_displayAddress]);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy21FMLabelViewController_location, (uint64_t *)&unk_1005D3350);
  swift_bridgeObjectRelease(*(_QWORD *)&self->mediator[OBJC_IVAR____TtC6FindMy21FMLabelViewController_selectedLabelValue]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy21FMLabelViewController_editingTableViewCellText));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy21FMLabelViewController_rightBarButtonItem));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC6FindMy21FMLabelViewController_keyboardWillShowObserver));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC6FindMy21FMLabelViewController_keyboardWillHideObserver));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy21FMLabelViewController_customLabels));
}

@end

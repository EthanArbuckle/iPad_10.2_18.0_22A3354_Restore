@implementation DOCSuggestionsTableViewController

- (_TtC5Files33DOCSuggestionsTableViewController)init
{
  return (_TtC5Files33DOCSuggestionsTableViewController *)sub_100412320();
}

- (_TtC5Files33DOCSuggestionsTableViewController)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtC5Files33DOCSuggestionsTableViewController *result;

  v5 = (char *)self + OBJC_IVAR____TtC5Files33DOCSuggestionsTableViewController_suggestionsTableViewDelegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5Files33DOCSuggestionsTableViewController_suggestions) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5Files33DOCSuggestionsTableViewController_sortedSuggestions) = (Class)_swiftEmptyArrayStorage;
  v6 = a3;

  result = (_TtC5Files33DOCSuggestionsTableViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x7070757320746F4ELL, 0xED0000646574726FLL, "Files/DOCSuggestionsTableViewController.swift", 45, 2, 118, 0);
  __break(1u);
  return result;
}

- (void)loadView
{
  id v3;
  _TtC5Files33DOCSuggestionsTableViewController *v4;
  id v5;

  v3 = objc_allocWithZone((Class)type metadata accessor for DOCSuggestionsTableView());
  v4 = self;
  v5 = objc_msgSend(v3, "initWithFrame:style:", 0, 0.0, 0.0, 0.0, 0.0);
  -[DOCSuggestionsTableViewController setView:](v4, "setView:", v5);

}

- (void)viewDidLoad
{
  _TtC5Files33DOCSuggestionsTableViewController *v2;

  v2 = self;
  sub_100412564();

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)resignFirstResponder
{
  _TtC5Files33DOCSuggestionsTableViewController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_100412854();

  return v3 & 1;
}

- (NSArray)keyCommands
{
  uint64_t v2;
  uint64_t v3;
  NSArray v4;

  v2 = sub_1004143FC();
  if (v2)
  {
    v3 = v2;
    sub_10004F2F0(0, &qword_1006445C0, UIKeyCommand_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)keyCommandMoveSelectionUp
{
  _TtC5Files33DOCSuggestionsTableViewController *v2;

  v2 = self;
  sub_100412DA4(-1, 1, 1);

}

- (void)keyCommandMoveSelectionDown
{
  _TtC5Files33DOCSuggestionsTableViewController *v2;

  v2 = self;
  sub_100412DA4(1, 1, 1);

}

- (void)keyCommandConfirmSelection
{
  _TtC5Files33DOCSuggestionsTableViewController *v2;

  v2 = self;
  sub_100412B84();

}

- (void)keyCommandCancelSelection
{
  _TtC5Files33DOCSuggestionsTableViewController *v2;

  v2 = self;
  sub_100412DA4(0, 2, 1);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Files33DOCSuggestionsTableViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10041384C((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v7;
  id v8;
  _TtC5Files33DOCSuggestionsTableViewController *v9;
  int64_t v10;

  v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC5Files33DOCSuggestionsTableViewController_suggestions);
  if (!((unint64_t)v4 >> 62))
    return *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v4 < 0)
    v7 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC5Files33DOCSuggestionsTableViewController_suggestions);
  else
    v7 = v4 & 0xFFFFFFFFFFFFFF8;
  v8 = a3;
  v9 = self;
  swift_bridgeObjectRetain(v4);
  v10 = _CocoaArrayWrapper.endIndex.getter(v7);

  swift_bridgeObjectRelease(v4);
  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Files33DOCSuggestionsTableViewController *v12;
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
  sub_100413AD4(v11);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (_TtC5Files33DOCSuggestionsTableViewController)initWithStyle:(int64_t)a3
{
  _TtC5Files33DOCSuggestionsTableViewController *result;

  result = (_TtC5Files33DOCSuggestionsTableViewController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCSuggestionsTableViewController", 39, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (_TtC5Files33DOCSuggestionsTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Files33DOCSuggestionsTableViewController *result;

  v4 = a4;
  result = (_TtC5Files33DOCSuggestionsTableViewController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCSuggestionsTableViewController", 39, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files33DOCSuggestionsTableViewController_suggestionsTableViewDelegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files33DOCSuggestionsTableViewController_suggestions));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files33DOCSuggestionsTableViewController_sortedSuggestions));
}

@end

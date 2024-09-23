@implementation MTTestActionContentPickerViewController

- (_TtC8Podcasts39MTTestActionContentPickerViewController)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC8Podcasts39MTTestActionContentPickerViewController *result;

  v4 = (char *)self + OBJC_IVAR____TtC8Podcasts39MTTestActionContentPickerViewController_delegate;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8Podcasts39MTTestActionContentPickerViewController_allowsMultipleSelection) = 1;
  v5 = a3;

  result = (_TtC8Podcasts39MTTestActionContentPickerViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x726F707075736E75, 0xEB00000000646574, "Podcasts/MTTestActionContentPicker.swift", 40, 2, 63, 0);
  __break(1u);
  return result;
}

- (_TtC8Podcasts39MTTestActionContentPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  char *v5;
  id v6;
  _TtC8Podcasts39MTTestActionContentPickerViewController *result;

  v5 = (char *)self + OBJC_IVAR____TtC8Podcasts39MTTestActionContentPickerViewController_delegate;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8Podcasts39MTTestActionContentPickerViewController_allowsMultipleSelection) = 1;
  v6 = a4;

  result = (_TtC8Podcasts39MTTestActionContentPickerViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x726F707075736E75, 0xEB00000000646574, "Podcasts/MTTestActionContentPicker.swift", 40, 2, 64, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100007A28((uint64_t)self + OBJC_IVAR____TtC8Podcasts39MTTestActionContentPickerViewController_delegate, &qword_10055FDB8);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8Podcasts39MTTestActionContentPickerViewController_contentDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Podcasts39MTTestActionContentPickerViewController_tableViewController));
}

- (void)viewDidLoad
{
  _TtC8Podcasts39MTTestActionContentPickerViewController *v2;

  v2 = self;
  sub_10029BC80();

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC8Podcasts39MTTestActionContentPickerViewController *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v6 = a3;
  v7 = self;
  v10 = sub_1002A011C(a4, v8, v9);

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8Podcasts39MTTestActionContentPickerViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_10029C2CC(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return *(_QWORD *)((*(_QWORD **)((char *)&self->super.super.super.isa
                                 + OBJC_IVAR____TtC8Podcasts39MTTestActionContentPickerViewController_contentDataSource))[2]
                   + 16);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC8Podcasts39MTTestActionContentPickerViewController *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = self;
  sub_10029C97C(v6, a4, v8);
  v10 = v9;

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8Podcasts39MTTestActionContentPickerViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10029CB60(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = type metadata accessor for IndexPath(0, a2, a3);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 0;
}

@end

@implementation BKLocalSignalStressTestViewController

- (BKLocalSignalStressTestViewController)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKLocalSignalStressTestViewController_cellDatas) = (Class)_swiftEmptyArrayStorage;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___BKLocalSignalStressTestViewController_operationInProgress) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___BKLocalSignalStressTestViewController____lazy_storage___dateFormatter) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LocalSignalStressTestViewController();
  return -[BKLocalSignalStressTestViewController initWithStyle:](&v3, "initWithStyle:", 2);
}

- (BKLocalSignalStressTestViewController)initWithCoder:(id)a3
{
  id v4;
  BKLocalSignalStressTestViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKLocalSignalStressTestViewController_cellDatas) = (Class)_swiftEmptyArrayStorage;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___BKLocalSignalStressTestViewController_operationInProgress) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___BKLocalSignalStressTestViewController____lazy_storage___dateFormatter) = 0;
  v4 = a3;

  result = (BKLocalSignalStressTestViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001007B93A0, "Books/LocalSignalStressTestViewController.swift", 47, 2, 51, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  BKLocalSignalStressTestViewController *v2;

  v2 = self;
  sub_1004A321C();

}

- (void)generateFakeLocalSignals:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  BKLocalSignalStressTestViewController *v8;
  uint64_t v9;
  BKLocalSignalStressTestViewController *v10;
  uint64_t v11;
  BKLocalSignalStressTestViewController *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _OWORD v16[2];

  v5 = sub_10004CFD4(&qword_1009D3150);
  __chkstk_darwin(v5);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v8 = self;
    v9 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    v10 = self;
  }
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v7, 1, 1, v11);
  type metadata accessor for MainActor(0);
  v12 = self;
  v13 = static MainActor.shared.getter(v12);
  v14 = (_QWORD *)swift_allocObject(&unk_100909FA8, 40, 7);
  v14[2] = v13;
  v14[3] = &protocol witness table for MainActor;
  v14[4] = v12;
  v15 = sub_10030C02C((uint64_t)v7, (uint64_t)&unk_1009E63C0, (uint64_t)v14);
  swift_release(v15);

  sub_100010960((uint64_t)v16, (uint64_t *)&unk_1009D04E0);
}

- (void)fetchBookHistories:(id)a3
{
  BKLocalSignalStressTestViewController *v5;
  uint64_t v6;
  BKLocalSignalStressTestViewController *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_1004A9344();

  sub_100010960((uint64_t)v8, (uint64_t *)&unk_1009D04E0);
}

- (void)enableRandomAssetIDsCell:(id)a3
{
  BKLocalSignalStressTestViewController *v5;
  uint64_t v6;
  BKLocalSignalStressTestViewController *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_1004A7DEC();

  sub_100010960((uint64_t)v8, (uint64_t *)&unk_1009D04E0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return String._bridgeToObjectiveC()();
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(_QWORD **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKLocalSignalStressTestViewController_cellDatas))[2];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  BKLocalSignalStressTestViewController *v12;
  __n128 v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1004A8084(v13);
  v15 = v14;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15;
}

- (BKLocalSignalStressTestViewController)initWithStyle:(int64_t)a3
{
  BKLocalSignalStressTestViewController *result;

  result = (BKLocalSignalStressTestViewController *)_swift_stdlib_reportUnimplementedInitializer("Books.LocalSignalStressTestViewController", 41, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (BKLocalSignalStressTestViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  BKLocalSignalStressTestViewController *result;

  v4 = a4;
  result = (BKLocalSignalStressTestViewController *)_swift_stdlib_reportUnimplementedInitializer("Books.LocalSignalStressTestViewController", 41, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR___BKLocalSignalStressTestViewController_cellDatas));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKLocalSignalStressTestViewController____lazy_storage___dateFormatter));
}

@end

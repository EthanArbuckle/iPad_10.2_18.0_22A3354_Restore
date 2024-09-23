@implementation ActivitySharingFriendDetailWorkoutListViewController

- (void)viewDidLoad
{
  _TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController *v2;

  v2 = self;
  sub_10059CE78();

}

- (_TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController_dataProviderObserver) = 0;
  v4 = a3;

  result = (_TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/ActivitySharingFriendDetailWorkoutListViewController.swift", 69, 2, 42, 0);
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  id v9;
  _TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v20;
  _QWORD v21[12];

  v6 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController_dataProvider);
  KeyPath = swift_getKeyPath(&unk_1006480F8);
  v8 = swift_getKeyPath(&unk_100648120);
  v9 = a3;
  v10 = self;
  static Published.subscript.getter(v21, v6, KeyPath, v8);
  swift_release(KeyPath);
  swift_release(v8);
  v11 = v21[0];
  v12 = (void *)v21[1];
  v13 = v21[2];
  v14 = (void *)v21[5];
  v16 = (void *)v21[7];
  v15 = v21[8];
  v17 = v21[9];

  swift_bridgeObjectRelease(v17);
  swift_release(v13);

  swift_release(v11);
  if ((unint64_t)v15 >> 62)
  {
    if (v15 < 0)
      v20 = v15;
    else
      v20 = v15 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v15);
    v18 = _CocoaArrayWrapper.endIndex.getter(v20);

    swift_bridgeObjectRelease(v15);
  }
  else
  {
    v18 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);

  }
  swift_bridgeObjectRelease(v15);
  return v18;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_10059D68C(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (_TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController)initWithStyle:(int64_t)a3
{
  _TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController *result;

  result = (_TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.ActivitySharingFriendDetailWorkoutListViewController", 63, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController *result;

  v4 = a4;
  result = (_TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.ActivitySharingFriendDetailWorkoutListViewController", 63, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController_dataProvider));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp52ActivitySharingFriendDetailWorkoutListViewController_dataProviderObserver));
}

@end

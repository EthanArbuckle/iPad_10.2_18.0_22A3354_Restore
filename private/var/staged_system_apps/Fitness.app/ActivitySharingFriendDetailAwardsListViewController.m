@implementation ActivitySharingFriendDetailAwardsListViewController

- (void)viewDidLoad
{
  _TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController *v2;

  v2 = self;
  sub_10029DD98();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ActivitySharingFriendDetailAwardsListViewController();
  v4 = (char *)v6.receiver;
  -[ActivitySharingFriendDetailAwardsListViewController viewDidAppear:](&v6, "viewDidAppear:", v3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController_achievementTransitionAnimator];
  *(_QWORD *)&v4[OBJC_IVAR____TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController_achievementTransitionAnimator] = 0;

}

- (_TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10029F170();
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  id v9;
  _TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController *v10;
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
                  + OBJC_IVAR____TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController_dataProvider);
  KeyPath = swift_getKeyPath(&unk_1006329A8);
  v8 = swift_getKeyPath(&unk_1006329D0);
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

  swift_bridgeObjectRelease(v15);
  swift_release(v13);

  swift_release(v11);
  if ((unint64_t)v17 >> 62)
  {
    if (v17 < 0)
      v20 = v17;
    else
      v20 = v17 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v17);
    v18 = _CocoaArrayWrapper.endIndex.getter(v20);

    swift_bridgeObjectRelease(v17);
  }
  else
  {
    v18 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);

  }
  swift_bridgeObjectRelease(v17);
  return v18;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_10029E5AC(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  CGSize result;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_10029F224((uint64_t)v12);
  v17 = v16;
  v19 = v18;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v20 = v17;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10029E968(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController *result;

  v3 = a3;
  result = (_TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.ActivitySharingFriendDetailAwardsListViewController", 62, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController *result;

  v4 = a4;
  result = (_TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.ActivitySharingFriendDetailAwardsListViewController", 62, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController_dataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController_cellHeightsCache));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController_dataProviderObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController_achievementTransitionAnimator));
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC10FitnessApp51ActivitySharingFriendDetailAwardsListViewController_achievementTransitionAnimator));
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  return 1;
}

@end

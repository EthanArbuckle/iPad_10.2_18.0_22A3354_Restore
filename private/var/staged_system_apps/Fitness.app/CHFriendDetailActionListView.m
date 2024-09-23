@implementation CHFriendDetailActionListView

- (CHFriendDetailActionListViewDelegate)delegate
{
  return (CHFriendDetailActionListViewDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___CHFriendDetailActionListView_delegate);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___CHFriendDetailActionListView_delegate, a3);
}

- (int64_t)actionCount
{
  return (*(_QWORD **)((char *)&self->super.super.super.isa + OBJC_IVAR___CHFriendDetailActionListView_actionTypes))[2];
}

- (CHFriendDetailActionListView)initWithFrame:(CGRect)a3
{
  return (CHFriendDetailActionListView *)sub_1003CDD54(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)configureWithActionTypes:(id)a3 labelTexts:(id)a4 footerText:(id)a5
{
  CHWorkoutDetailHeartRateTableViewCell *v8;
  char *v9;
  id v10;
  CHFriendDetailActionListView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SEL v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  SEL v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v8 = (CHWorkoutDetailHeartRateTableViewCell *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for Int);
  v9 = (char *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  v10 = a5;
  v11 = self;
  sub_1003CE1C4(v8, v9, v10, v12, v13, v14, v15, v16);

  swift_bridgeObjectRelease(v8, v17, v18, v19, v20, v21, v22, v23);
  swift_bridgeObjectRelease((CHWorkoutDetailHeartRateTableViewCell *)v9, v24, v25, v26, v27, v28, v29, v30);
}

- (CHFriendDetailActionListView)initWithCoder:(id)a3
{
  id v3;
  __n128 v4;

  v3 = a3;
  sub_1003CEB48(v4);
}

- (void).cxx_destruct
{
  SEL v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  SEL v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char *v17;
  uint64_t v18;

  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.isa+ OBJC_IVAR___CHFriendDetailActionListView_actionTypes), v3, v4, v5, v6, v7, v8, v9);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.isa+ OBJC_IVAR___CHFriendDetailActionListView_labelTexts), v10, v11, v12, v13, v14, v15, v16);

  sub_1000F61B4((uint64_t)self + OBJC_IVAR___CHFriendDetailActionListView_delegate);
  v17 = (char *)self + OBJC_IVAR___CHFriendDetailActionListView_cellRegistration;
  v18 = sub_100047110(&qword_100831B38);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v17, v18);
  sub_1003CF1C0((uint64_t)self + OBJC_IVAR___CHFriendDetailActionListView____lazy_storage___footerRegistration);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (*(_QWORD **)((char *)&self->super.super.super.isa + OBJC_IVAR___CHFriendDetailActionListView_actionTypes))[2];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  CHFriendDetailActionListView *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_1003CE66C((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  CHFriendDetailActionListView *v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;

  v8 = sub_100047110(&qword_100831AA8);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for IndexPath(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = self;
  sub_1003CDA68((uint64_t)v11);
  v18 = sub_10001E724(0, &qword_100831B18, UICollectionViewListCell_ptr);
  v19 = (void *)UICollectionView.dequeueConfiguredReusableSupplementary<A>(using:for:)(v11, v15, v18);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  return v19;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  sub_1003CEA24(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, char *))sub_1003CEE1C);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  CHFriendDetailActionListView *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1003CEF20((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  sub_1003CEA24(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, char *))sub_1003CEFB8);
}

@end

@implementation CHWorkoutDetailGuidedRunMediaMomentsTableViewCell

- (id)onDidTapMediaMomentItem
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;

  if (!*(Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_onDidTapMediaMomentItem))
    return 0;
  v2 = *(_QWORD *)&self->mediaMomentArtworkCollectionView[OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_onDidTapMediaMomentItem];
  v6[4] = *(Class *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_onDidTapMediaMomentItem);
  v7 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_1000277E8;
  v6[3] = &unk_10079CA68;
  v3 = _Block_copy(v6);
  v4 = v7;
  swift_retain(v2);
  swift_release(v4);
  return v3;
}

- (void)setOnDidTapMediaMomentItem:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v6)();
  uint64_t (**v7)();
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_10079CA50, 24, 7);
    v4[2] = v5;
    v6 = sub_10019B2A8;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self
                      + OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_onDidTapMediaMomentItem);
  v9 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_onDidTapMediaMomentItem);
  v8 = *(_QWORD *)&self->mediaMomentArtworkCollectionView[OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_onDidTapMediaMomentItem];
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_100022BA4(v9, v8);
}

- (CHWorkoutDetailGuidedRunMediaMomentsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CHWorkoutDetailHeartRateTableViewCell *v5;
  CHWorkoutDetailHeartRateTableViewCell *v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (CHWorkoutDetailGuidedRunMediaMomentsTableViewCell *)sub_1003BAEB0(a3, (uint64_t)a4, v6);
}

- (void)configureWithWorkout:(id)a3 fitnessAppContext:(id)a4
{
  id v6;
  id v7;
  CHWorkoutDetailGuidedRunMediaMomentsTableViewCell *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1003BB480(v6, v7);

}

- (CHWorkoutDetailGuidedRunMediaMomentsTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003BBE94();
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

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_mediaMomentArtworkCollectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_workout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_fitnessAppContext));
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_mediaMomentArtworkItems), v3, v4, v5, v6, v7, v8, v9);
  sub_100022BA4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_onDidTapMediaMomentItem), *(_QWORD *)&self->mediaMomentArtworkCollectionView[OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_onDidTapMediaMomentItem]);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v7;
  id v8;
  CHWorkoutDetailGuidedRunMediaMomentsTableViewCell *v9;
  int64_t v10;

  v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_mediaMomentArtworkItems);
  if (!((unint64_t)v4 >> 62))
    return *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v4 < 0)
    v7 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_mediaMomentArtworkItems);
  else
    v7 = v4 & 0xFFFFFFFFFFFFFF8;
  v8 = a3;
  v9 = self;
  swift_bridgeObjectRetain(v4);
  v10 = _CocoaArrayWrapper.endIndex.getter(v7);

  swift_bridgeObjectRelease(v4);
  return v10;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  CHWorkoutDetailGuidedRunMediaMomentsTableViewCell *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_1003BBB38(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  CHWorkoutDetailGuidedRunMediaMomentsTableViewCell *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1003BBFAC((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  double v10;
  double v11;
  uint64_t v12;
  CGSize result;

  v6 = type metadata accessor for IndexPath(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v10 = 164.0;
  v11 = 164.0;
  result.height = v11;
  result.width = v10;
  return result;
}

@end

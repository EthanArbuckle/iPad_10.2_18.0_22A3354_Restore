@implementation TrophyCaseSectionViewController

- (_TtC10FitnessApp31TrophyCaseSectionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002BED78();
}

- (void)dealloc
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC10FitnessApp31TrophyCaseSectionViewController *v7;
  objc_super v8;

  v3 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_achievementDataProvider);
  v4 = v3[3];
  v5 = v3[4];
  sub_100016804(v3, v4);
  v6 = sub_1000083D8(&qword_10082CD50, type metadata accessor for TrophyCaseSectionViewController, (uint64_t)&unk_1006337B0);
  v7 = self;
  dispatch thunk of AAUIAwardsDataProviding.remove(observer:)(v7, v6, v4, v5);

  v8.receiver = v7;
  v8.super_class = (Class)type metadata accessor for TrophyCaseSectionViewController(0);
  -[TrophyCaseSectionViewController dealloc](&v8, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_section;
  v4 = type metadata accessor for AAUIAwardsDataProviderSection(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_healthStore));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.super.super.super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_achievementDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_badgeImageFactory));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_resourceProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_localizationProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_pauseRingsCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_fitnessAppContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_workoutFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_workoutDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_friendListManager));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_achievements));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_transitionAnimator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_transitionAnimatorFromViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_cellHeightsCache));
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TrophyCaseSectionViewController(0);
  v4 = (char *)v5.receiver;
  -[TrophyCaseSectionViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_localizationProvider], "setPaused:", objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_pauseRingsCoordinator], "isPaused", v5.receiver, v5.super_class));
  sub_1002BD480();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC10FitnessApp31TrophyCaseSectionViewController *v4;

  v4 = self;
  sub_1002BD2CC(a3);

}

- (void)preferredContentSizeDidChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC10FitnessApp31TrophyCaseSectionViewController *v9;
  id v10;
  void *v11;
  uint64_t v12;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1002BD480();
  v10 = -[TrophyCaseSectionViewController collectionView](v9, "collectionView");
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, "reloadData");

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC10FitnessApp31TrophyCaseSectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC10FitnessApp31TrophyCaseSectionViewController *result;

  v3 = a3;
  result = (_TtC10FitnessApp31TrophyCaseSectionViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.TrophyCaseSectionViewController", 42, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp31TrophyCaseSectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10FitnessApp31TrophyCaseSectionViewController *result;

  v4 = a4;
  result = (_TtC10FitnessApp31TrophyCaseSectionViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.TrophyCaseSectionViewController", 42, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v7;
  id v8;
  _TtC10FitnessApp31TrophyCaseSectionViewController *v9;
  int64_t v10;

  v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_achievements);
  if (!((unint64_t)v4 >> 62))
    return *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v4 < 0)
    v7 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC10FitnessApp31TrophyCaseSectionViewController_achievements);
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
  _TtC10FitnessApp31TrophyCaseSectionViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_1002BDF08(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _TtC10FitnessApp31TrophyCaseSectionViewController *v17;
  id v18;
  __n128 v19;
  uint64_t v21;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = self;
  v18 = sub_1002BE18C(v16, v13, v15);

  v19 = swift_bridgeObjectRelease(v15);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v19);
  return v18;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp31TrophyCaseSectionViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1002BE428(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  _TtC10FitnessApp31TrophyCaseSectionViewController *v13;
  void *v14;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = self;
  v14 = sub_1002BF074((void *)a4, v11, v12);

  return v14;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  return 1;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC10FitnessApp31TrophyCaseSectionViewController *v15;
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
  sub_1002BF2AC((uint64_t)v12);
  v17 = v16;
  v19 = v18;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v20 = v17;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7;
  id v8;
  _TtC10FitnessApp31TrophyCaseSectionViewController *v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double Width;
  double v23;
  CGSize result;
  CGRect v25;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = -[TrophyCaseSectionViewController view](v9, "view");
  if (v10)
  {
    v13 = v10;
    objc_msgSend(v10, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    v25.origin.x = v15;
    v25.origin.y = v17;
    v25.size.width = v19;
    v25.size.height = v21;
    Width = CGRectGetWidth(v25);
    v23 = sub_1005B26EC(Width);

    v11 = Width;
    v12 = v23;
  }
  else
  {
    __break(1u);
  }
  result.height = v12;
  result.width = v11;
  return result;
}

@end

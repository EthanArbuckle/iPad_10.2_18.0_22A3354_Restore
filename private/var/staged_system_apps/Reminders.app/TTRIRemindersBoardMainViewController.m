@implementation TTRIRemindersBoardMainViewController

- (_TtC9Reminders36TTRIRemindersBoardMainViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10036FE64();
}

- (void)loadView
{
  _TtC9Reminders36TTRIRemindersBoardMainViewController *v2;

  v2 = self;
  sub_1003604FC();

}

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC9Reminders36TTRIRemindersBoardMainViewController *v3;

  v3 = self;
  sub_100360608((uint64_t)v3, v2);

}

- (void)viewWillLayoutSubviews
{
  char *v2;
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self, a2);
  v2 = (char *)v4.receiver;
  -[TTRIRemindersBoardMainViewController viewWillLayoutSubviews](&v4, "viewWillLayoutSubviews");
  v3 = *(_QWORD *)&v2[OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_deferredViewActionProvider];
  if (v3)
  {
    swift_retain(*(_QWORD *)&v2[OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_deferredViewActionProvider]);
    TTRDeferredViewActionProvider.viewWillLayoutSubviews()();

    swift_release(v3);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC9Reminders36TTRIRemindersBoardMainViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_100362280(a4, (uint64_t)v8, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _TtC9Reminders36TTRIRemindersBoardMainViewController *v6;

  v4 = a4;
  v6 = self;
  sub_100362510(a3, v4);

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  char *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType(self, a2);
  v6 = a3;
  v7 = a4;
  v8 = (char *)v9.receiver;
  -[TTRIRemindersBoardMainViewController didUpdateFocusInContext:withAnimationCoordinator:](&v9, "didUpdateFocusInContext:withAnimationCoordinator:", v6, v7);
  if (!objc_msgSend(v8, "isViewLoaded", v9.receiver, v9.super_class))
  {

    goto LABEL_5;
  }
  if (*(_QWORD *)&v8[OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_focusController])
  {
    swift_retain();
    sub_10034FB8C(v6);

    swift_release();
LABEL_5:

    return;
  }
  __break(1u);
}

- (NSArray)preferredFocusEnvironments
{
  _TtC9Reminders36TTRIRemindersBoardMainViewController *v2;
  NSArray *result;
  _QWORD *v4;
  Class isa;

  v2 = self;
  result = (NSArray *)-[TTRIRemindersBoardMainViewController isViewLoaded](v2, "isViewLoaded");
  if (!(_DWORD)result)
  {

    v4 = _swiftEmptyArrayStorage;
    goto LABEL_5;
  }
  if (*(Class *)((char *)&v2->super.super.super.isa
                + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_focusController))
  {
    swift_retain();
    v4 = sub_10034CAC4();

    swift_release();
LABEL_5:
    sub_10002A750((uint64_t *)&unk_100652070);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
    return (NSArray *)isa;
  }
  __break(1u);
  return result;
}

- (_TtC9Reminders36TTRIRemindersBoardMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9Reminders36TTRIRemindersBoardMainViewController *result;

  v4 = a4;
  result = (_TtC9Reminders36TTRIRemindersBoardMainViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIRemindersBoardMainViewController", 46, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_targetItemsForVisibleContextMenu));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_mainDataSource));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_rootViewDragInteractionHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_columnReorderingController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_mainScrollingController));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_dummyContentScrollView));
  swift_release();
  sub_10017A1E8(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_completedHeaderViewState), *(_QWORD *)&self->initialFrameForLoadingView[OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_completedHeaderViewState]);
  objc_release(*(id *)&self->initialFrameForLoadingView[OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_completedRemindersState
                                                      + 8]);
  sub_1000073A0((uint64_t)self + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_listInfo, &qword_100649CA0);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  id v15;
  _TtC9Reminders36TTRIRemindersBoardMainViewController *v16;
  uint64_t v17;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = *(uint64_t *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_eventPublishers);
  v14 = a3;
  v15 = a4;
  v16 = self;
  swift_retain(v13);
  PassthroughSubject.send(_:)(v12);

  swift_release(v13);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  id v15;
  _TtC9Reminders36TTRIRemindersBoardMainViewController *v16;
  uint64_t v17;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = *(_QWORD *)&self->initialFrameForLoadingView[OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_eventPublishers];
  v14 = a3;
  v15 = a4;
  v16 = self;
  swift_retain(v13);
  PassthroughSubject.send(_:)(v12);

  swift_release(v13);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  id result;
  void *v24;
  id v25;
  _TtC9Reminders36TTRIRemindersBoardMainViewController *v26;
  id v27;
  void (*v28)(char *, uint64_t);
  Class isa;
  uint64_t v30;
  uint64_t v31;

  v11 = type metadata accessor for IndexPath(0);
  v31 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v16 = (char *)&v30 - v15;
  __chkstk_darwin(v17);
  v19 = (char *)&v30 - v18;
  __chkstk_darwin(v20);
  v22 = (char *)&v30 - v21;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  result = (id)static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v24 = *(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_columnReorderingController);
  if (v24)
  {
    v25 = a3;
    v26 = self;
    v27 = v24;
    sub_1002493A0((uint64_t)v19, (uint64_t)v16, (uint64_t)v13, (uint64_t)v22);

    v28 = *(void (**)(char *, uint64_t))(v31 + 8);
    v28(v13, v11);
    v28(v16, v11);
    v28(v19, v11);
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    v28(v22, v11);
    return isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t ObjectType;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(char *, uint64_t, uint64_t);
  id v21;
  _TtC9Reminders36TTRIRemindersBoardMainViewController *v22;
  void *v23;
  uint64_t v24;

  v8 = sub_10002A750((uint64_t *)&unk_100640EB0);
  __chkstk_darwin(v8);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for IndexPath(0);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v11);
  v14 = v12;
  if (*(_QWORD *)(v12 + 16))
  {
    swift_bridgeObjectRelease(v12);
    return 0;
  }
  else
  {
    v16 = *(_QWORD *)&self->initialFrameForLoadingView[OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_presenter];
    ObjectType = swift_getObjectType(*(Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_presenter), v13);
    v18 = type metadata accessor for TTRRemindersListViewModel.Item(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v10, 1, 1, v18);
    v19 = *(_QWORD *)(v16 + 8);
    v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 752);
    v21 = a3;
    v22 = self;
    v23 = (void *)v20(v10, ObjectType, v19);
    sub_1000073A0((uint64_t)v10, (uint64_t *)&unk_100640EB0);

    swift_bridgeObjectRelease(v14);
    return v23;
  }
}

@end

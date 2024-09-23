@implementation NowPlayingViewController

- (_TtC12NowPlayingUI24NowPlayingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_6E2C0();
}

- (void)dealloc
{
  _TtC12NowPlayingUI24NowPlayingViewController *v2;

  v2 = self;
  sub_629C8();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_objectGraph));
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.super.super.isa
                                                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_metrics));
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.super.super.isa
                                                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_controlsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_descriptionTextViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_showNotesTextViewController));
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.super.super.isa
                                                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_chapterResultsController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_bindings));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_dismissalTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_playerRequestController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController____lazy_storage___prototypeShowNotesController));
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.super.super.isa
                                                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_episodeTextInfoProvider));
  sub_9944((uint64_t)self + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_episodeTextInfoDetail, &qword_1FD868);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_supportedSections));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_availableSections));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_descriptionHeaderSizingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_showNotesHeaderSizingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_queueHeaderSizingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_chapterHeaderSizingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController__systemPodcastsResponse));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_textDrawingCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_scrollingTipView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_scrollingTipDimmingView));
}

- (void)viewDidLoad
{
  _TtC12NowPlayingUI24NowPlayingViewController *v2;

  v2 = self;
  sub_62D48();

}

- (void)dismissTapGestureRecognizerFired
{
  -[NowPlayingViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC12NowPlayingUI24NowPlayingViewController *v4;

  v4 = self;
  sub_63C4C(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC12NowPlayingUI24NowPlayingViewController *v4;

  v4 = self;
  sub_64448(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC12NowPlayingUI24NowPlayingViewController *v4;

  v4 = self;
  sub_64BE8(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC12NowPlayingUI24NowPlayingViewController *v2;

  v2 = self;
  sub_64D78();

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC12NowPlayingUI24NowPlayingViewController *v5;

  v4 = a3;
  v5 = self;
  sub_65E40(v4);

}

- (_TtC12NowPlayingUI24NowPlayingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NowPlayingUI24NowPlayingViewController *result;

  v4 = a4;
  result = (_TtC12NowPlayingUI24NowPlayingViewController *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.NowPlayingViewController", 37, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (BOOL)collectionView:(id)a3 dragSessionIsRestrictedToDraggingApplication:(id)a4
{
  return 1;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC12NowPlayingUI24NowPlayingViewController *v14;
  _QWORD *v15;
  Class isa;
  uint64_t v18;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  swift_unknownObjectRetain(a4);
  v14 = self;
  v15 = sub_6E58C((uint64_t)v12);

  swift_unknownObjectRelease(a4);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_F174(0, &qword_1FD8B8, UIDragItem_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v15);
  return isa;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6;
  _TtC12NowPlayingUI24NowPlayingViewController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_67B60((uint64_t)v6, (uint64_t)a4);

  swift_unknownObjectRelease(a4);
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtC12NowPlayingUI24NowPlayingViewController *v15;
  void *v16;
  void *v17;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1FA950);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v12 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = a3;
  swift_unknownObjectRetain(a4);
  v15 = self;
  sub_6E8F0(a4, (uint64_t)v11);
  v17 = v16;

  swift_unknownObjectRelease(a4);
  sub_9944((uint64_t)v11, (uint64_t *)&unk_1FA950);
  return v17;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  uint64_t v4;
  _TtC12NowPlayingUI24NowPlayingViewController *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  v4 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_availableSections);
  v5 = self;
  v6 = a3;
  v7 = swift_bridgeObjectRetain(v4);
  v8 = sub_97EFC(v7, (uint64_t)v5);
  swift_bridgeObjectRelease(v4);
  v9 = *(_QWORD *)(v8 + 16);

  swift_bridgeObjectRelease(v8);
  return v9;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC12NowPlayingUI24NowPlayingViewController *v7;
  int64_t v8;
  int64_t v9;

  v6 = a3;
  v7 = self;
  sub_6ECD8(a4);
  v9 = v8;

  return v9;
}

- (void)configureCell:(id)a3 forPodcastEpisode:(id)a4
{
  char *v6;
  id v7;
  _TtC12NowPlayingUI24NowPlayingViewController *v8;

  v6 = (char *)a3;
  v7 = a4;
  v8 = self;
  sub_68594(v6, v7);

}

- (void)configureCell:(id)a3 forSong:(id)a4
{
  id v6;
  id v7;
  _TtC12NowPlayingUI24NowPlayingViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_6F300((uint64_t)v6, v7);

}

- (void)configureCell:(id)a3 forTVEpisode:(id)a4
{
  id v6;
  id v7;
  _TtC12NowPlayingUI24NowPlayingViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_6F4FC((uint64_t)v6, v7);

}

- (void)configureCell:(id)a3 forMovie:(id)a4
{
  id v6;
  id v7;
  _TtC12NowPlayingUI24NowPlayingViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_6F68C((uint64_t)v6, v7);

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC12NowPlayingUI24NowPlayingViewController *v12;
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
  sub_68B2C((uint64_t)v11, (uint64_t)v10);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC12NowPlayingUI24NowPlayingViewController *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_6F974(v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  id v19;
  _TtC12NowPlayingUI24NowPlayingViewController *v20;
  void (*v21)(char *, uint64_t);
  Class isa;
  uint64_t v24;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v24 - v15;
  __chkstk_darwin(v14);
  v18 = (char *)&v24 - v17;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v19 = a3;
  v20 = self;
  sub_6A5B0((uint64_t)v20, (uint64_t)v16, (uint64_t)v13, (uint64_t)v18);

  v21 = *(void (**)(char *, uint64_t))(v10 + 8);
  v21(v13, v9);
  v21(v16, v9);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v21(v18, v9);
  return isa;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC12NowPlayingUI24NowPlayingViewController *v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_6F898((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  _TtC12NowPlayingUI24NowPlayingViewController *v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v19 - v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = self;
  sub_6E670((uint64_t)v15);

  v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v13, v9);
  v18(v15, v9);
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _TtC12NowPlayingUI24NowPlayingViewController *v16;
  void *v17;
  void *v18;
  __n128 v19;
  uint64_t v21;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = v13;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v15 = a3;
  v16 = self;
  sub_6AC84((uint64_t)v15);
  v18 = v17;

  v19 = swift_bridgeObjectRelease(v14);
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
  _TtC12NowPlayingUI24NowPlayingViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_6B310(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForHeaderInSection:(int64_t)a5
{
  id v8;
  id v9;
  _TtC12NowPlayingUI24NowPlayingViewController *v10;
  double v11;
  double v12;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_6FAB0((uint64_t)v8, a5);
  v12 = v11;

  return v12;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForRowAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC12NowPlayingUI24NowPlayingViewController *v15;
  double v16;
  uint64_t v18;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  v16 = sub_7013C(v13);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v16;
}

- (int64_t)collectionView:(id)a3 tableLayout:(id)a4 editingStyleForRowAtIndexPath:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v6 = type metadata accessor for IndexPath(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return 0;
}

- (id)collectionView:(id)a3 tableLayout:(id)a4 trailingSwipeActionsForRowAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC12NowPlayingUI24NowPlayingViewController *v15;
  _QWORD *v16;
  Class isa;
  uint64_t v19;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  v16 = sub_706E8((uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if (!v16)
    return 0;
  sub_F174(0, (unint64_t *)&unk_1FD888, UISwipeAction_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v16);
  return isa;
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  void *v6;
  id v7;
  _TtC12NowPlayingUI24NowPlayingViewController *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_713B8(v7, v8, v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  id v6;
  id v7;
  _TtC12NowPlayingUI24NowPlayingViewController *v8;
  unsigned __int8 v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_719C4(v6, (uint64_t)v7);

  return v9 & 1;
}

- (id)accessibilityCollectionView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingViewController_collectionView));
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC12NowPlayingUI24NowPlayingViewController *v8;
  unsigned __int8 v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_71B0C(v7);

  return v9 & 1;
}

@end

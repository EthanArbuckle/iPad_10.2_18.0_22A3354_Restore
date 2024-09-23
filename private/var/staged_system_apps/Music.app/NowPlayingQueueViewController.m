@implementation NowPlayingQueueViewController

- (BOOL)canPresentViewControllers
{
  return 1;
}

- (void)dealloc
{
  uint64_t v2;
  _TtC5Music29NowPlayingQueueViewController *v3;
  uint64_t v4;
  Swift::Int *Playing;
  Swift::Int v6;
  Swift::Int v7;
  void (*v8)(_BYTE *, _QWORD);
  __C::MPCPlayerRequestTracklistRange v9;
  objc_super v10;
  _BYTE v11[32];

  v2 = qword_10119B8B0;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_10119B8B0, sub_1000E948C);
  v4 = qword_10124C788;
  Playing = (Swift::Int *)MPCPlayerRequestTracklistRange.upNextPlayingItems.unsafeMutableAddressor();
  v6 = *Playing;
  v7 = Playing[1];
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v4 + 752))(v11);
  v9.reverseCount = v6;
  v9.forwardCount = v7;
  Player.NowPlayingConfiguration.remove(_:)(v9);
  v8(v11, 0);
  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for NowPlayingQueueViewController(0);
  -[NowPlayingQueueViewController dealloc](&v10, "dealloc");
}

- (void).cxx_destruct
{
  uint64_t v3;
  void *v4;

  sub_10005B748((uint64_t)self + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_updateContext, _s13UpdateContextVMa);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_prefetchingController));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_metricsReporter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController____lazy_storage___collectionView));
  sub_10013C71C((uint64_t)self + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_delegate, v3);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController__playerResponse));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_historyRequestController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController__historyResponse));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_dataSource));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_bindings));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_headerSizingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_autoPlayHeaderSizingView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_feedbackGenerator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController____lazy_storage___emptyStateLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_visibleSeparators));
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController__hasSeenSharedListeningQueueItemRemoveAlert);
  swift_bridgeObjectRelease(*(_QWORD *)&self->metricsReporter[OBJC_IVAR____TtC5Music29NowPlayingQueueViewController__hasSeenSharedListeningQueueItemRemoveAlert]);

  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_onEndContextMenuInteraction), *(_QWORD *)&self->prefetchingController[OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_onEndContextMenuInteraction]);
}

- (_TtC5Music29NowPlayingQueueViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002A1580();
}

- (void)viewDidLoad
{
  _TtC5Music29NowPlayingQueueViewController *v2;

  v2 = self;
  sub_100285E70();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NowPlayingQueueViewController(0);
  v4 = v5.receiver;
  -[NowPlayingQueueViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  v4[OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_currentSection] = 3;
  v4[OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_didAppearOnce] = 1;

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NowPlayingQueueViewController(0);
  v4 = (char *)v5.receiver;
  -[NowPlayingQueueViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
  if (objc_msgSend(v4, "isBeingDismissed", v5.receiver, v5.super_class))
    objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_historyRequestController], "endAutomaticResponseLoading");

}

- (void)viewLayoutMarginsDidChange
{
  _TtC5Music29NowPlayingQueueViewController *v2;

  v2 = self;
  sub_100289098();

}

- (void)viewSafeAreaInsetsDidChange
{
  id v2;
  id v3;
  double v4;
  double v5;
  __n128 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for NowPlayingQueueViewController(0);
  v2 = v7.receiver;
  -[NowPlayingQueueViewController viewSafeAreaInsetsDidChange](&v7, "viewSafeAreaInsetsDidChange");
  v3 = sub_100283684();
  objc_msgSend(v3, "contentSize", v7.receiver, v7.super_class);
  v5 = v4;

  sub_10028ADC0(0, v6, v5);
}

- (void)viewDidLayoutSubviews
{
  _TtC5Music29NowPlayingQueueViewController *v2;

  v2 = self;
  sub_100289624();

}

- (void)handleLongPress:(id)a3
{
  _TtC5Music29NowPlayingQueueViewController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_100289D40(v5);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC5Music29NowPlayingQueueViewController *v8;

  v4 = a3;
  v8 = self;
  objc_msgSend(v4, "setDecelerationRate:", UIScrollViewDecelerationRateNormal);
  objc_msgSend(v4, "contentOffset");
  v5 = (Class *)((char *)&v8->super.super.super.isa
               + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_initialDraggingOffset);
  *v5 = v6;
  v5[1] = v7;
  *((_BYTE *)&v8->super.super.super.isa + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_shouldPlayHapticFeedback) = 1;

}

- (void)scrollViewDidScroll:(id)a3
{
  _TtC5Music29NowPlayingQueueViewController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_10028A124(v5);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  _TtC5Music29NowPlayingQueueViewController *v8;
  double v9;
  id v10;

  y = a4.y;
  v10 = a3;
  v8 = self;
  sub_10028A654(v10, &a5->x, v9, y);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  objc_msgSend(a3, "setDecelerationRate:", UIScrollViewDecelerationRateNormal);
}

- (_TtC5Music29NowPlayingQueueViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Music29NowPlayingQueueViewController *result;

  v4 = a4;
  result = (_TtC5Music29NowPlayingQueueViewController *)_swift_stdlib_reportUnimplementedInitializer("Music.NowPlayingQueueViewController", 35, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void)configureCell:(id)a3 forSong:(id)a4
{
  char *v6;
  id v7;
  _TtC5Music29NowPlayingQueueViewController *v8;

  v6 = (char *)a3;
  v7 = a4;
  v8 = self;
  sub_1002A290C(v6, v7);

}

- (void)configureCell:(id)a3 forMovie:(id)a4
{
  char *v6;
  id v7;
  _TtC5Music29NowPlayingQueueViewController *v8;

  v6 = (char *)a3;
  v7 = a4;
  v8 = self;
  sub_1002A2A50(v6, v7);

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC5Music29NowPlayingQueueViewController *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_1002A2B40(v14, v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  sub_10029A3C0(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t)a6, (void (*)(id, uint64_t, uint64_t, char *))sub_1002A3280);
}

- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6
{
  sub_10029A3C0(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t)a6, (void (*)(id, uint64_t, uint64_t, char *))sub_1002A3738);
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  _TtC5Music29NowPlayingQueueViewController *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = self;
  v9 = sub_10029A4B8((uint64_t)v7, x, y);
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  uint64_t v10;
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
  id v23;
  _TtC5Music29NowPlayingQueueViewController *v24;
  void (*v25)(char *, uint64_t);
  Class isa;
  uint64_t v28;
  _TtC5Music29NowPlayingQueueViewController *v29;

  v29 = self;
  v10 = type metadata accessor for IndexPath(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v16 = (char *)&v28 - v15;
  __chkstk_darwin(v17);
  v19 = (char *)&v28 - v18;
  __chkstk_darwin(v20);
  v22 = (char *)&v28 - v21;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v23 = a3;
  v24 = v29;
  sub_10029A60C((uint64_t)v19, (uint64_t)v13, v22);

  v25 = *(void (**)(char *, uint64_t))(v11 + 8);
  v25(v13, v10);
  v25(v16, v10);
  v25(v19, v10);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v25(v22, v10);
  return isa;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Music29NowPlayingQueueViewController *v12;
  char v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10029AD74(v11, (uint64_t)v10);
  LOBYTE(self) = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Music29NowPlayingQueueViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10029AFFC((uint64_t)v11, v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC5Music29NowPlayingQueueViewController *v11;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5, v10);
  v11 = self;
  sub_1002A38DC(v9, a5);

  swift_unknownObjectRelease(a5);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC5Music29NowPlayingQueueViewController *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v8 = type metadata accessor for IndexPath(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = self;
  sub_1002A3B80((uint64_t)v11);
  v15 = v14;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v15;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC5Music29NowPlayingQueueViewController *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10029E87C(v6, v7);
  v10 = v9;

  return v10;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  return -[NowPlayingQueueViewController collectionView:previewForHighlightingContextMenuWithConfiguration:](self, "collectionView:previewForHighlightingContextMenuWithConfiguration:", a3, a4);
}

- (id)_collectionView:(id)a3 indexPathOfReferenceItemToPreserveContentOffsetWithProposedReference:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  Class isa;
  uint64_t v15;

  v5 = sub_100007E8C((uint64_t *)&unk_1011A3D50);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v10 = (char *)&v15 - v9;
  if (a4)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v11 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v7, 0, 1, v11);
  }
  else
  {
    v11 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v7, 1, 1, v11);
  }
  type metadata accessor for IndexPath(0);
  v12 = *(_QWORD *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  sub_10004FF60((uint64_t)v7, (uint64_t *)&unk_1011A3D50);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) != 1)
  {
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
  }
  return isa;
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC5Music29NowPlayingQueueViewController *v14;
  id v15;
  __n128 v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;

  v7 = sub_100007E8C((uint64_t *)&unk_1011A13B0);
  __chkstk_darwin(v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject(&unk_1010BC8C0, 24, 7);
  *(_QWORD *)(v11 + 16) = v10;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  type metadata accessor for MainActor(0);
  v13 = a3;
  v14 = self;
  v15 = v13;
  v16 = swift_retain();
  v17 = static MainActor.shared.getter(v16);
  v18 = (_QWORD *)swift_allocObject(&unk_1010BC8E8, 64, 7);
  v18[2] = v17;
  v18[3] = &protocol witness table for MainActor;
  v18[4] = v14;
  v18[5] = sub_100253D40;
  v18[6] = v11;
  v18[7] = v15;
  sub_100166D14((uint64_t)v9, (uint64_t)&unk_1011A9948, (uint64_t)v18);

  swift_release();
  swift_release();
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_onEndContextMenuInteraction);
  v6 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC5Music29NowPlayingQueueViewController_onEndContextMenuInteraction);
  v7 = v5[1];
  *v5 = 0;
  v5[1] = 0;
  sub_10004BA30(v6, v7);
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  uint64_t v9;
  void *v10;
  _TtC5Music29NowPlayingQueueViewController *v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[6];

  if (a5)
  {
    v9 = swift_allocObject(&unk_1010BC870, 24, 7);
    *(_QWORD *)(v9 + 16) = self;
    v15[4] = sub_1002A122C;
    v15[5] = v9;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 1107296256;
    v15[2] = sub_1001DBD98;
    v15[3] = &unk_1010BC888;
    v10 = _Block_copy(v15);
    v11 = self;
    v12 = a3;
    v13 = a4;
    swift_unknownObjectRetain(a5, v14);
    objc_msgSend(a5, "addCompletion:", v10, swift_release().n128_f64[0]);
    _Block_release(v10);

    swift_unknownObjectRelease(a5);
  }
}

@end

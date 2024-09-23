@implementation MusicMessagesSharingViewController

- (_TtC16MusicMessagesApp34MusicMessagesSharingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC16MusicMessagesApp34MusicMessagesSharingViewController *)sub_100009A74(v5, v7, a4);
}

- (_TtC16MusicMessagesApp34MusicMessagesSharingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10000E180();
}

- (void)dealloc
{
  _TtC16MusicMessagesApp34MusicMessagesSharingViewController *v2;

  v2 = self;
  sub_100009F5C();
}

- (void).cxx_destruct
{
  sub_10000FF08((uint64_t)self + OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController__contextMenuInteraction));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController__activePreviewingTrack));
  sub_10000FE2C((uint64_t)self+ OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController__previewedItemIndexToIgnoreForNextSelect, &qword_1004B7410);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController__collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController__collectionFlowLayout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController__mediaLibraryQueue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController__nowPlayingObserverToken));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController__nowPlayingObserver));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController__sharableTracks));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController__sharableTracksByStoreIdentifier));
}

- (void)viewDidLoad
{
  _TtC16MusicMessagesApp34MusicMessagesSharingViewController *v2;

  v2 = self;
  sub_10000A198();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicMessagesApp34MusicMessagesSharingViewController *v6;

  v5 = a3;
  v6 = self;
  sub_10000A58C((uint64_t)a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicMessagesApp34MusicMessagesSharingViewController *v2;

  v2 = self;
  sub_10000A6E0();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MusicMessagesSharingViewController(0);
  v4 = v5.receiver;
  -[MusicMessagesSharingViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  sub_10000BC60();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC16MusicMessagesApp34MusicMessagesSharingViewController *v4;

  v4 = self;
  sub_10000A8C8(a3, (SEL *)&selRef_viewWillDisappear_);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC16MusicMessagesApp34MusicMessagesSharingViewController *v4;

  v4 = self;
  sub_10000A8C8(a3, (SEL *)&selRef_viewDidDisappear_);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for MusicMessagesSharingViewController(0);
  swift_unknownObjectRetain(a4);
  v7 = v14.receiver;
  -[MusicMessagesSharingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v8 = swift_allocObject(&unk_100465100, 24, 7);
  *(_QWORD *)(v8 + 16) = v7;
  v12[4] = sub_10000FEF8;
  v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10000AA40;
  v12[3] = &unk_100465118;
  v9 = _Block_copy(v12);
  v10 = v13;
  v11 = v7;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v9, 0, swift_release(v10).n128_f64[0]);
  _Block_release(v9);
  swift_unknownObjectRelease(a4);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC16MusicMessagesApp34MusicMessagesSharingViewController *v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  id v14;
  _TtC16MusicMessagesApp34MusicMessagesSharingViewController *v15;
  uint64_t v16;
  uint64_t v18;
  int64_t v19;

  v6 = OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController__sharableTracks;
  v7 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController__sharableTracks);
  if (!((unint64_t)v7 >> 62))
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    v9 = a3;
    v10 = self;
    if (v8 >= 1)
      goto LABEL_3;
LABEL_9:

    return 1;
  }
  if (v7 < 0)
    v13 = *(uint64_t *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController__sharableTracks);
  else
    v13 = v7 & 0xFFFFFFFFFFFFFF8;
  v14 = a3;
  v15 = self;
  swift_bridgeObjectRetain(v7);
  v16 = _CocoaArrayWrapper.endIndex.getter(v13);
  swift_bridgeObjectRelease(v7);
  if (v16 < 1)
    goto LABEL_9;
LABEL_3:
  v11 = *(uint64_t *)((char *)&self->super.super.super.isa + v6);
  if (!((unint64_t)v11 >> 62))
  {
    v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);

    return v12;
  }
  if (v11 < 0)
    v18 = *(uint64_t *)((char *)&self->super.super.super.isa + v6);
  else
    v18 = v11 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*(Class *)((char *)&self->super.super.super.isa + v6));
  v19 = _CocoaArrayWrapper.endIndex.getter(v18);

  swift_bridgeObjectRelease(v11);
  return v19;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC16MusicMessagesApp34MusicMessagesSharingViewController *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10000ACA4((uint64_t)v11, (uint64_t)v10);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC16MusicMessagesApp34MusicMessagesSharingViewController *v13;
  void *v14;
  uint64_t v16;

  v8 = type metadata accessor for IndexPath(0, a2, a3);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v12 = a3;
  v13 = self;
  v14 = (void *)sub_10000E4A4((uint64_t)v12, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v14;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v6 = type metadata accessor for IndexPath(0, a2, a3);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  LOBYTE(a4) = *(Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC16MusicMessagesApp34MusicMessagesSharingViewController__activePreviewingTrack) == 0;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (char)a4;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC16MusicMessagesApp34MusicMessagesSharingViewController *v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_10000E638((uint64_t)v10);

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
  _TtC16MusicMessagesApp34MusicMessagesSharingViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10000E814((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC16MusicMessagesApp34MusicMessagesSharingViewController *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  CGSize result;

  v9 = type metadata accessor for IndexPath(0, a2, a3);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  v16 = sub_10000EA20((uint64_t)v13);
  v18 = v17;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7;
  id v8;
  _TtC16MusicMessagesApp34MusicMessagesSharingViewController *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_10000ECD0(v7);
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v5 = *(double *)&qword_1004B8100;
  v6 = 0.0;
  v7 = *(double *)&qword_1004B8100;
  v8 = *(double *)&qword_1004B8100;
  result.right = v8;
  result.bottom = v7;
  result.left = v5;
  result.top = v6;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 10.0;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC16MusicMessagesApp34MusicMessagesSharingViewController *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10000EEA0(v6);

  return v9;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  _TtC16MusicMessagesApp34MusicMessagesSharingViewController *v8;
  id v9;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = self;
  v9 = sub_10000F084(x, y);

  return v9;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  sub_10000B890(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(void))sub_10000F770);
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  sub_10000B890(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(void))sub_10000F888);
}

@end

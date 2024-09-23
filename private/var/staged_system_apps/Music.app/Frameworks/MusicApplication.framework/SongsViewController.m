@implementation SongsViewController

- (_TtC16MusicApplication19SongsViewController)init
{
  return (_TtC16MusicApplication19SongsViewController *)sub_4F4640();
}

- (_TtC16MusicApplication19SongsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_4FDF3C();
}

- (void)viewWillAppear:(BOOL)a3
{
  sub_4F633C(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillAppear_, 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_4F633C(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillDisappear_, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC16MusicApplication19SongsViewController *v4;

  v4 = self;
  sub_4F63B0(a3);

}

- (void)viewDidLoad
{
  double v2;
  _TtC16MusicApplication19SongsViewController *v3;

  v3 = self;
  sub_4F6594(v2);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication19SongsViewController *v6;

  v5 = a3;
  v6 = self;
  sub_4F8864(a3);

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
  v14.super_class = (Class)type metadata accessor for SongsViewController();
  swift_unknownObjectRetain(a4);
  v7 = v14.receiver;
  -[SongsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v8 = swift_allocObject(&unk_136BCF8, 24, 7);
  *(_QWORD *)(v8 + 16) = v7;
  v12[4] = sub_4FF0C0;
  v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_20B50C;
  v12[3] = &block_descriptor_71_0;
  v9 = _Block_copy(v12);
  v10 = v13;
  v11 = v7;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v9, 0, swift_release(v10).n128_f64[0]);
  _Block_release(v9);
  swift_unknownObjectRelease(a4);

}

- (void)viewDidLayoutSubviews
{
  id v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SongsViewController();
  v2 = v9.receiver;
  -[SongsViewController viewDidLayoutSubviews](&v9, "viewDidLayoutSubviews");
  v3 = objc_msgSend(v2, "view", v9.receiver, v9.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "bounds");
    sub_4F911C(v5, v6, v7, v8);

  }
  else
  {
    __break(1u);
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4;
  _TtC16MusicApplication19SongsViewController *v5;
  int64_t v6;
  int64_t v7;

  v4 = a3;
  v5 = self;
  sub_4FE13C();
  v7 = v6;

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC16MusicApplication19SongsViewController *v7;
  int64_t v8;
  int64_t v9;

  v6 = a3;
  v7 = self;
  sub_4FE1CC(a4);
  v9 = v8;

  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication19SongsViewController *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_4F9340((uint64_t)v11, (uint64_t)v10);
  v15 = v14;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _TtC16MusicApplication19SongsViewController *v19;
  void *v20;
  void *v21;
  uint64_t v23;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = self;
  sub_4F9AD0((uint64_t)v16, v13, v15, (uint64_t)v12);
  v21 = v20;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_bridgeObjectRelease(v15);

  return v21;
}

- (id)_sectionIndexTitlesForCollectionView:(id)a3
{
  _TtC16MusicApplication19SongsViewController *v4;
  id v5;
  _QWORD *v6;
  NSArray v7;

  v4 = self;
  v5 = a3;
  v6 = sub_4FE274();

  if (v6)
  {
    v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v7.super.isa = 0;
  }
  return v7.super.isa;
}

- (id)_collectionView:(id)a3 indexPathForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  _TtC16MusicApplication19SongsViewController *v14;
  uint64_t v15;
  uint64_t v16;
  Class isa;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14AD540);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v12;
  }
  v13 = a3;
  v14 = self;
  sub_4FA920((uint64_t)a4, a5, (uint64_t)v11);

  swift_bridgeObjectRelease(a4);
  v15 = type metadata accessor for IndexPath(0);
  v16 = *(_QWORD *)(v15 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v11, 1, v15) != 1)
  {
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v15);
  }
  return isa;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC16MusicApplication19SongsViewController *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_4FE2E4(v9, a5);

  swift_unknownObjectRelease(a5);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC16MusicApplication19SongsViewController *v14;
  id v15;
  uint64_t v17;

  v8 = type metadata accessor for IndexPath(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = a4;
  v14 = self;
  v15 = sub_4FE568(v12, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v15;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC16MusicApplication19SongsViewController *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_4FE7B0(v6, v7);

  return v9;
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _TtC16MusicApplication19SongsViewController *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  uint64_t v16;

  if (a5)
  {
    v9 = swift_allocObject(&unk_136BB40, 24, 7);
    *(_QWORD *)(v9 + 16) = self;
    v15[4] = sub_4FEDFC;
    v16 = v9;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 1107296256;
    v15[2] = sub_42D124;
    v15[3] = &block_descriptor_34_2;
    v10 = _Block_copy(v15);
    v11 = v16;
    v12 = self;
    v13 = a3;
    v14 = a4;
    swift_unknownObjectRetain(a5);
    objc_msgSend(a5, "addCompletion:", v10, swift_release(v11).n128_f64[0]);
    _Block_release(v10);

    swift_unknownObjectRelease(a5);
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  _TtC16MusicApplication19SongsViewController *v16;
  uint64_t v17;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = self;
  sub_4FEAEC(v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication19SongsViewController *v13;
  char v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = UICollectionView.isDraggingCell(at:)();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return (v14 & 1) == 0;
}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  unint64_t v9;
  id v10;
  char v11;
  _BYTE v13[16];

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13[15] = 0;
  v9 = sub_8AFF0();
  v10 = a4;
  v11 = FeatureFlagsKey.isEnabled.getter((uint64_t)&type metadata for Feature.Music, v9);
  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);

  return v11 & 1;
}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication19SongsViewController *v13;
  Class isa;
  unsigned __int8 v15;
  uint64_t v17;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v15 = -[SongsViewController collectionView:shouldSelectItemAtIndexPath:](v13, "collectionView:shouldSelectItemAtIndexPath:", v11, isa);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication19SongsViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_4FB530(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC16MusicApplication19SongsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC16MusicApplication19SongsViewController *result;

  v3 = a3;
  result = (_TtC16MusicApplication19SongsViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.SongsViewController", 36, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (_TtC16MusicApplication19SongsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication19SongsViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication19SongsViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.SongsViewController", 36, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication19SongsViewController_requestController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19SongsViewController_filterOptionsController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication19SongsViewController_sortOptionsController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication19SongsViewController_indexBarController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication19SongsViewController____lazy_storage___contentFilteringController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication19SongsViewController_mediaPickerAddController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication19SongsViewController_addKeepLocalController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication19SongsViewController____lazy_storage___noContentStateController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication19SongsViewController_bindings));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication19SongsViewController_textDrawingCache));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication19SongsViewController_artworkCachingReference));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19SongsViewController_artworkPrefetchingController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication19SongsViewController_dragDropController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication19SongsViewController_playbackIndicator));
}

@end

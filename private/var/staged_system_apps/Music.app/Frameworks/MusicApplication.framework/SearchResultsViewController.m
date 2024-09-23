@implementation SearchResultsViewController

- (_TtC16MusicApplication27SearchResultsViewController)init
{
  return (_TtC16MusicApplication27SearchResultsViewController *)sub_788D24();
}

- (_TtC16MusicApplication27SearchResultsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_79A784();
}

- (void)viewDidLoad
{
  _TtC16MusicApplication27SearchResultsViewController *v2;

  v2 = self;
  sub_7890B8();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC16MusicApplication27SearchResultsViewController *v4;

  v4 = self;
  sub_78B65C(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SearchResultsViewController(0);
  v4 = v5.receiver;
  -[SearchResultsViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  sub_7906A8();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC16MusicApplication27SearchResultsViewController *v4;

  v4 = self;
  sub_78B9A4(a3);

}

- (void)viewDidLayoutSubviews
{
  id v2;
  _QWORD *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SearchResultsViewController(0);
  v2 = v4.receiver;
  -[SearchResultsViewController viewDidLayoutSubviews](&v4, "viewDidLayoutSubviews");
  v3 = sub_7901E4();
  sub_86C708();

  swift_release(v3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication27SearchResultsViewController *v6;

  v5 = a3;
  v6 = self;
  sub_78BCD8(a3);

}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC16MusicApplication27SearchResultsViewController *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_79AABC(v9, a5);

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
  _TtC16MusicApplication27SearchResultsViewController *v14;
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
  v15 = sub_79AD64(v12, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v15;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC16MusicApplication27SearchResultsViewController *v8;
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
  _TtC16MusicApplication27SearchResultsViewController *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  uint64_t v16;

  if (a5)
  {
    v9 = swift_allocObject(&unk_13805A0, 24, 7);
    *(_QWORD *)(v9 + 16) = self;
    v15[4] = sub_79B7EC;
    v16 = v9;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 1107296256;
    v15[2] = sub_42D124;
    v15[3] = &block_descriptor_115_0;
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

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication27SearchResultsViewController *v13;
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

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication27SearchResultsViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_79AEB8((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
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
  _TtC16MusicApplication27SearchResultsViewController *v16;
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
  sub_79B0F0(v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  _TtC16MusicApplication27SearchResultsViewController *v16;
  _QWORD *v17;
  __n128 v18;
  uint64_t v19;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = self;
  v17 = sub_78ED04();
  sub_A11500((uint64_t)v12);

  v18 = swift_release(v17);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v18);

}

- (_TtC16MusicApplication27SearchResultsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication27SearchResultsViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication27SearchResultsViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.SearchResultsViewController", 44, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_mediaPickerAddController));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_onDidSelectItem), *(_QWORD *)&self->mediaPickerAddController[OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_onDidSelectItem]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_onContextMenuPresentation), *(_QWORD *)&self->mediaPickerAddController[OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_onContextMenuPresentation]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_onAddKeepLocalControl), *(_QWORD *)&self->mediaPickerAddController[OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_onAddKeepLocalControl]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_onPageRenderFinish), *(_QWORD *)&self->mediaPickerAddController[OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_onPageRenderFinish]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_contextActionsModelLoadingHandler), *(_QWORD *)&self->mediaPickerAddController[OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_contextActionsModelLoadingHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_onDragSessionStart), *(_QWORD *)&self->mediaPickerAddController[OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_onDragSessionStart]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_resultsLoadingWatchdog));
  sub_5C0DC((uint64_t)self + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController__frozenResults, type metadata accessor for Search.ResultContext);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController__unfrozenResults, &qword_14DC1A0);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController____lazy_storage___impressionsTracker));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_dragDropController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_textDrawingCache));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_artworkCachingReference));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_componentController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_jsSearchResultItemTranslator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController____lazy_storage___dateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController____lazy_storage___playabilityController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController____lazy_storage___loadingView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController____lazy_storage___noContentController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_collectionView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_addKeepLocalController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication27SearchResultsViewController_playbackIndicator));
}

@end

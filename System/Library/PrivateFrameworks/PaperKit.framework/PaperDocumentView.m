@implementation PaperDocumentView

- (_TtC8PaperKit17PaperDocumentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized PaperDocumentView.init(coder:)();
}

- (void)dealloc
{
  _TtC8PaperKit17PaperDocumentView *v2;

  v2 = self;
  PaperDocumentView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v3 = (char *)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_viewUUID;
  v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_pageOverlayViewProvider);
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_delegate);
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_dataModelInitialState, (uint64_t *)&demangling cache variable for type metadata for Capsule<PaperDocument>?);
  v5 = (char *)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_dataModel;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PaperDocument>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_documentDelegate));
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit17PaperDocumentView____lazy_storage___paperDocumentViewProxy));

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_updateDocAsset, (uint64_t *)&demangling cache variable for type metadata for CRAsset?);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v7 = (char *)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_changedDeadline;
  v8 = type metadata accessor for ContinuousClock.Instant();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  swift_release();
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_liveStreamMessenger);
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_participantDetailsDataSource);
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_textualContextProvider);
  swift_release();
  swift_bridgeObjectRelease();
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.super.isa
                                                                          + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_docScanDismissBlock));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit17PaperDocumentView__rulerHostingDelegate));
  swift_unknownObjectWeakDestroy();
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_magicGenerativePlaygroundTokenProvider, &demangling cache variable for type metadata for MagicGenerativePlaygroundTokenProvider?);
  swift_unknownObjectRelease();
}

- (void)layoutSubviews
{
  _TtC8PaperKit17PaperDocumentView *v2;

  v2 = self;
  PaperDocumentView.layoutSubviews()();

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)toolPickerSelectedToolDidChange:(id)a3
{
  id v4;
  _TtC8PaperKit17PaperDocumentView *v5;

  v4 = a3;
  v5 = self;
  PaperDocumentView.updateTiledViewInk(for:)(v4);

}

- (void)toolPickerSelectedToolItemDidChange:(id)a3
{
  id v4;
  _TtC8PaperKit17PaperDocumentView *v5;

  v4 = a3;
  v5 = self;
  PaperDocumentView.updateTiledViewInk(for:)(v4);

}

- (void)toolPickerIsRulerActiveDidChange:(id)a3
{
  void *v3;
  id v5;
  _TtC8PaperKit17PaperDocumentView *v6;
  id v7;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_tiledView);
  if (v3)
  {
    v5 = a3;
    v6 = self;
    v7 = v3;
    objc_msgSend(v7, sel_setRulerEnabled_, objc_msgSend(v5, sel_isRulerActive));

  }
  else
  {
    __break(1u);
  }
}

- (void)toolPickerVisibilityDidChange:(id)a3
{
  id v4;
  void *v5;
  _TtC8PaperKit17PaperDocumentView *v6;

  v4 = a3;
  v6 = self;
  if ((objc_msgSend(v4, sel_isVisible) & 1) != 0)
    goto LABEL_4;
  v5 = *(Class *)((char *)&v6->super.super.super.isa + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_tiledView);
  if (v5)
  {
    objc_msgSend(v5, sel_setRulerEnabled_, 0);
LABEL_4:

    return;
  }
  __break(1u);
}

- (void)pdfSelectionChanged:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8PaperKit17PaperDocumentView *v9;
  uint64_t v10;

  v4 = type metadata accessor for Notification();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  PaperDocumentView.pdfSelectionChanged(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)annotationPropertiesChanged:(id)a3
{
  @objc PaperDocumentView.annotationPropertiesChanged(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))PaperDocumentView.annotationPropertiesChanged(_:));
}

- (void)annotationsChanged:(id)a3
{
  @objc PaperDocumentView.annotationPropertiesChanged(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))PaperDocumentView.annotationsChanged(_:));
}

- (id)pdfView:(id)a3 overlayViewForPage:(id)a4
{
  PDFView *v6;
  PDFPage *v7;
  _TtC8PaperKit17PaperDocumentView *v8;
  UIView_optional *v9;
  void *v10;
  void *v11;

  v6 = (PDFView *)a3;
  v7 = (PDFPage *)a4;
  v8 = self;
  PaperDocumentView.pdfView(_:overlayViewFor:)(v9, v6, v7);
  v11 = v10;

  return v11;
}

- (void)pdfView:(id)a3 willDisplayOverlayView:(id)a4 forPage:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC8PaperKit17PaperDocumentView *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  specialized PaperDocumentView.pdfView(_:willDisplayOverlayView:for:)(v10);

}

- (void)pdfView:(id)a3 willEndDisplayingOverlayView:(id)a4 forPage:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC8PaperKit17PaperDocumentView *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  specialized PaperDocumentView.pdfView(_:willEndDisplayingOverlayView:for:)(v10);

}

- (void)didMoveToSuperview
{
  _TtC8PaperKit17PaperDocumentView *v2;

  v2 = self;
  PaperDocumentView.didMoveToSuperview()();

}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  uint64_t v6;
  _TtC8PaperKit17PaperDocumentView *v7;
  UIDocumentPickerViewController *_;

  type metadata accessor for URL();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  _ = (UIDocumentPickerViewController *)a3;
  v7 = self;
  PaperDocumentView.documentPicker(_:didPickDocumentsAt:)(_, (Swift::OpaquePointer)v6);
  swift_bridgeObjectRelease();

}

- (void)documentPickerWasCancelled:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  id v8;
  _TtC8PaperKit17PaperDocumentView *v9;
  _BOOL4 IsReduceMotionEnabled;

  v5 = (char *)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_delegate;
  swift_beginAccess();
  if (MEMORY[0x1DF0E666C](v5))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = a3;
    v9 = self;
    IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    (*(void (**)(_TtC8PaperKit17PaperDocumentView *, id, BOOL, uint64_t, uint64_t))(v6 + 40))(v9, v8, !IsReduceMotionEnabled, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void)pageDidScroll:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(void);
  _TtC8PaperKit17PaperDocumentView *v12;
  uint64_t v13;

  v4 = type metadata accessor for Notification();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = (char *)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_delegate;
  swift_beginAccess();
  if (MEMORY[0x1DF0E666C](v9))
  {
    v10 = *((_QWORD *)v9 + 1);
    swift_getObjectType();
    v11 = *(void (**)(void))(v10 + 96);
    v12 = self;
    v11();

    swift_unknownObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (_TtC8PaperKit17PaperDocumentView)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit17PaperDocumentView *result;

  result = (_TtC8PaperKit17PaperDocumentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

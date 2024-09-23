@implementation AnyCanvas

- (_TtC8PaperKit9AnyCanvas)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized AnyCanvas.init(coder:)();
}

- (_TtC8PaperKit9AnyCanvas)initWithFrame:(CGRect)a3
{
  specialized AnyCanvas.init(coder:)();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit9AnyCanvas_delegate);

  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit9AnyCanvas_overlayViewControllerForPresentingUI));
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit9AnyCanvas_participantDetailsDataSource);
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit9AnyCanvas_canvasStateLiveStreamMessenger);
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit9AnyCanvas_textualContextProvider);
  v3 = (char *)self + OBJC_IVAR____TtC8PaperKit9AnyCanvas_canvasState;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Capsule<CanvasState>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  v5 = (char *)self + OBJC_IVAR____TtC8PaperKit9AnyCanvas__canvasUUID;
  v6 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit9AnyCanvas_analytics_timeOfOpeningContainerView, &demangling cache variable for type metadata for Date?);
  swift_bridgeObjectRelease();

  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit9AnyCanvas_magicGenerativePlaygroundTokenProvider, &demangling cache variable for type metadata for MagicGenerativePlaygroundTokenProvider?);
}

@end

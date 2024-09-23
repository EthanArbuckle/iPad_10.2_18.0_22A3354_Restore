@implementation BookReaderAccessoryHighlightsController

- (void)dealloc
{
  _TtC5Books39BookReaderAccessoryHighlightsController *v2;

  v2 = self;
  BookReaderAccessoryHighlightsController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC5Books39BookReaderAccessoryHighlightsController_adornmentState;
  v4 = type metadata accessor for BookContentAdornmentState(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books39BookReaderAccessoryHighlightsController_delegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Books39BookReaderAccessoryHighlightsController_selectionInfos));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Books39BookReaderAccessoryHighlightsController_resolveStates));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Books39BookReaderAccessoryHighlightsController_highlightRenderingController));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Books39BookReaderAccessoryHighlightsController_annotationProvider);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books39BookReaderAccessoryHighlightsController_paginatingService);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books39BookReaderAccessoryHighlightsController_readingSettingsProvider);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books39BookReaderAccessoryHighlightsController_annotationProviderService);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC5Books39BookReaderAccessoryHighlightsController_contentLayoutController);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books39BookReaderAccessoryHighlightsController_selectionHighlightController);
  sub_100010960((uint64_t)self + OBJC_IVAR____TtC5Books39BookReaderAccessoryHighlightsController_currentTheme, (uint64_t *)&unk_1009D6290);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Books39BookReaderAccessoryHighlightsController_currentHighlights));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Books39BookReaderAccessoryHighlightsController_interactiveHighlight));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Books39BookReaderAccessoryHighlightsController_cancellables));
}

- (_TtC5Books39BookReaderAccessoryHighlightsController)init
{
  _TtC5Books39BookReaderAccessoryHighlightsController *result;

  result = (_TtC5Books39BookReaderAccessoryHighlightsController *)_swift_stdlib_reportUnimplementedInitializer("Books.BookReaderAccessoryHighlightsController", 45, "init()", 6, 0);
  __break(1u);
  return result;
}

@end

@implementation BookReaderAccessoryAccessibilityController

- (void)dealloc
{
  _TtC5Books42BookReaderAccessoryAccessibilityController *v2;

  v2 = self;
  sub_1004470E8();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC5Books42BookReaderAccessoryAccessibilityController_adornmentState;
  v4 = type metadata accessor for BookContentAdornmentState(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC5Books42BookReaderAccessoryAccessibilityController_logger;
  v6 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Books42BookReaderAccessoryAccessibilityController_annotationProvider);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books42BookReaderAccessoryAccessibilityController_paginatingService);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books42BookReaderAccessoryAccessibilityController_annotationProviderService);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC5Books42BookReaderAccessoryAccessibilityController_contentLayoutController);
  sub_1001FE9A0((uint64_t)self+ OBJC_IVAR____TtC5Books42BookReaderAccessoryAccessibilityController_bookContentAccessoryAccessibilityHandler);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books42BookReaderAccessoryAccessibilityController_pageNumberProvider);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC5Books42BookReaderAccessoryAccessibilityController_chromeStateController);
  sub_100010960((uint64_t)self + OBJC_IVAR____TtC5Books42BookReaderAccessoryAccessibilityController_currentLocation, &qword_1009E3508);
  sub_100010960((uint64_t)self + OBJC_IVAR____TtC5Books42BookReaderAccessoryAccessibilityController_currentTheme, (uint64_t *)&unk_1009D6290);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Books42BookReaderAccessoryAccessibilityController_noteOrder));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Books42BookReaderAccessoryAccessibilityController_cancellables));
}

- (_TtC5Books42BookReaderAccessoryAccessibilityController)init
{
  _TtC5Books42BookReaderAccessoryAccessibilityController *result;

  result = (_TtC5Books42BookReaderAccessoryAccessibilityController *)_swift_stdlib_reportUnimplementedInitializer("Books.BookReaderAccessoryAccessibilityController", 48, "init()", 6, 0);
  __break(1u);
  return result;
}

@end

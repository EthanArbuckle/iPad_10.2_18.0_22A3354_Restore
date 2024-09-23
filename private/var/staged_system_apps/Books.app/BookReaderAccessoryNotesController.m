@implementation BookReaderAccessoryNotesController

- (void)dealloc
{
  _TtC5Books34BookReaderAccessoryNotesController *v2;

  v2 = self;
  sub_10069560C();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC5Books34BookReaderAccessoryNotesController_adornmentState;
  v4 = type metadata accessor for BookContentAdornmentState(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books34BookReaderAccessoryNotesController_delegate);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Books34BookReaderAccessoryNotesController_annotationProvider);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books34BookReaderAccessoryNotesController_paginatingService);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books34BookReaderAccessoryNotesController_readingSettingsProvider);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books34BookReaderAccessoryNotesController_annotationProviderService);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC5Books34BookReaderAccessoryNotesController_contentLayoutController);
  sub_100010960((uint64_t)self + OBJC_IVAR____TtC5Books34BookReaderAccessoryNotesController_currentTheme, (uint64_t *)&unk_1009D6290);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Books34BookReaderAccessoryNotesController_noteOrder));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Books34BookReaderAccessoryNotesController_notes));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Books34BookReaderAccessoryNotesController_cancellables));
}

- (_TtC5Books34BookReaderAccessoryNotesController)init
{
  _TtC5Books34BookReaderAccessoryNotesController *result;

  result = (_TtC5Books34BookReaderAccessoryNotesController *)_swift_stdlib_reportUnimplementedInitializer("Books.BookReaderAccessoryNotesController", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

@end

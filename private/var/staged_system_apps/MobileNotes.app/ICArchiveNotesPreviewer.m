@implementation ICArchiveNotesPreviewer

- (id)initForArchiveAt:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v5 = type metadata accessor for URL(0);
  __chkstk_darwin(v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return ICArchiveNotesPreviewer.init(forArchiveAt:)((uint64_t)v7);
}

- (_TtC11MobileNotes23ICArchiveNotesPreviewer)init
{
  _TtC11MobileNotes23ICArchiveNotesPreviewer *result;

  result = (_TtC11MobileNotes23ICArchiveNotesPreviewer *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.ICArchiveNotesPreviewer", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC11MobileNotes23ICArchiveNotesPreviewer_archivePreviewer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11MobileNotes23ICArchiveNotesPreviewer_notes));
}

@end

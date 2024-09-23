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

- (_TtC38com_apple_mobilenotes_SharingExtension23ICArchiveNotesPreviewer)init
{
  _TtC38com_apple_mobilenotes_SharingExtension23ICArchiveNotesPreviewer *result;

  result = (_TtC38com_apple_mobilenotes_SharingExtension23ICArchiveNotesPreviewer *)_swift_stdlib_reportUnimplementedInitializer("com_apple_mobilenotes_SharingExtension.ICArchiveNotesPreviewer", 62, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension23ICArchiveNotesPreviewer_archivePreviewer), a2);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension23ICArchiveNotesPreviewer_notes));
}

@end

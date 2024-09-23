@implementation DOCDocumentManager.DocumentCreationSession

- (void)dealloc
{
  _TtCC5Files18DOCDocumentManager23DocumentCreationSession *v2;

  v2 = self;
  sub_100414A70();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtCC5Files18DOCDocumentManager23DocumentCreationSession_identifier;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC5Files18DOCDocumentManager23DocumentCreationSession_targetLocation));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC5Files18DOCDocumentManager23DocumentCreationSession_serviceViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC5Files18DOCDocumentManager23DocumentCreationSession_snapshotCoverView));
}

- (_TtCC5Files18DOCDocumentManager23DocumentCreationSession)init
{
  _TtCC5Files18DOCDocumentManager23DocumentCreationSession *result;

  result = (_TtCC5Files18DOCDocumentManager23DocumentCreationSession *)_swift_stdlib_reportUnimplementedInitializer("Files.DocumentCreationSession", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

@end

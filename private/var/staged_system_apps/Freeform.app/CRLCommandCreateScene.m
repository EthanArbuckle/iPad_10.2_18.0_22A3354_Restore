@implementation CRLCommandCreateScene

- (_TtC8Freeform21CRLCommandCreateScene)init
{
  _TtC8Freeform21CRLCommandCreateScene *result;

  result = (_TtC8Freeform21CRLCommandCreateScene *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandCreateScene", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform21CRLCommandCreateScene_sceneID;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.committed[OBJC_IVAR____TtC8Freeform21CRLCommandCreateScene_actionString]);
}

@end

@implementation CRLCommandSetStickyPreset

- (NSUUID)id
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (_TtC8Freeform25CRLCommandSetStickyPreset)init
{
  _TtC8Freeform25CRLCommandSetStickyPreset *result;

  result = (_TtC8Freeform25CRLCommandSetStickyPreset *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandSetStickyPreset", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC8Freeform25CRLCommandSetStickyPreset_id;
  v3 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end

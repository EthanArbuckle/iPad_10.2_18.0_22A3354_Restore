@implementation CRLSharedHighlight

- (NSString)description
{
  _TtC8Freeform18CRLSharedHighlight *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1004DE0BC();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC8Freeform18CRLSharedHighlight)init
{
  _TtC8Freeform18CRLSharedHighlight *result;

  result = (_TtC8Freeform18CRLSharedHighlight *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLSharedHighlight", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform18CRLSharedHighlight_shareURL;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->swHighlight[OBJC_IVAR____TtC8Freeform18CRLSharedHighlight_boardTitle]);
  sub_1004BBB8C((uint64_t)self + OBJC_IVAR____TtC8Freeform18CRLSharedHighlight_boardIdentifier);
  v5 = (char *)self + OBJC_IVAR____TtC8Freeform18CRLSharedHighlight_timeStamp;
  v6 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease(*(_QWORD *)&self->swHighlight[OBJC_IVAR____TtC8Freeform18CRLSharedHighlight_shareString]);

}

@end

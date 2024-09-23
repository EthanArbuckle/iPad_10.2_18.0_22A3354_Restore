@implementation CRLUSDRendering.CoreRE.AppExRepBackend

- (_TtCOO8Freeform15CRLUSDRendering6CoreRE15AppExRepBackend)init
{
  _TtCOO8Freeform15CRLUSDRendering6CoreRE15AppExRepBackend *result;

  result = (_TtCOO8Freeform15CRLUSDRendering6CoreRE15AppExRepBackend *)_swift_stdlib_reportUnimplementedInitializer("Freeform.AppExRepBackend", 24, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtCOO8Freeform15CRLUSDRendering6CoreRE15AppExRepBackend_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCOO8Freeform15CRLUSDRendering6CoreRE15AppExRepBackend_metalLayer));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCOO8Freeform15CRLUSDRendering6CoreRE15AppExRepBackend__backendState));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCOO8Freeform15CRLUSDRendering6CoreRE15AppExRepBackend_firstFrameRenderedSubscription));
  v3 = (char *)self + OBJC_IVAR____TtCOO8Freeform15CRLUSDRendering6CoreRE15AppExRepBackend_uuid;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end

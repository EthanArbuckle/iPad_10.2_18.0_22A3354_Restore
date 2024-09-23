@implementation HighlightMenuIdentifier

- (id)copyWithZone:(void *)a3
{
  _TtC8BookCoreP33_213CCCF002B71F6D33A127415B0D848C23HighlightMenuIdentifier *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  _QWORD v8[3];
  uint64_t v9;

  v3 = self;
  sub_1A1510(v8);

  v4 = v9;
  v5 = sub_185554(v8, v9);
  v6 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v5, v4);
  sub_184A38(v8);
  return v6;
}

- (_TtC8BookCoreP33_213CCCF002B71F6D33A127415B0D848C23HighlightMenuIdentifier)init
{
  _TtC8BookCoreP33_213CCCF002B71F6D33A127415B0D848C23HighlightMenuIdentifier *result;

  result = (_TtC8BookCoreP33_213CCCF002B71F6D33A127415B0D848C23HighlightMenuIdentifier *)_swift_stdlib_reportUnimplementedInitializer("BookCore.HighlightMenuIdentifier", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8BookCoreP33_213CCCF002B71F6D33A127415B0D848C23HighlightMenuIdentifier_annotationUUID));
  sub_175F14((uint64_t)self + OBJC_IVAR____TtC8BookCoreP33_213CCCF002B71F6D33A127415B0D848C23HighlightMenuIdentifier_delegate);
}

@end

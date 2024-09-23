@implementation RDFeatureFlagsTemporaryOverrideObjcWrapper

- (void)finish
{
  void *v3;
  uint64_t v4;
  uint64_t ObjectType;
  _TtC7remindd42RDFeatureFlagsTemporaryOverrideObjcWrapper *v6;
  id v7;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd42RDFeatureFlagsTemporaryOverrideObjcWrapper_backing);
  v4 = *(_QWORD *)&self->backing[OBJC_IVAR____TtC7remindd42RDFeatureFlagsTemporaryOverrideObjcWrapper_backing];
  ObjectType = swift_getObjectType(v3);
  v6 = self;
  v7 = v3;
  dispatch thunk of REMFeatureFlagsTemporaryOverride.finish()(ObjectType, v4);

}

- (_TtC7remindd42RDFeatureFlagsTemporaryOverrideObjcWrapper)init
{
  _TtC7remindd42RDFeatureFlagsTemporaryOverrideObjcWrapper *result;

  result = (_TtC7remindd42RDFeatureFlagsTemporaryOverrideObjcWrapper *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDFeatureFlagsTemporaryOverrideObjcWrapper", 50, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7remindd42RDFeatureFlagsTemporaryOverrideObjcWrapper_backing));
}

@end

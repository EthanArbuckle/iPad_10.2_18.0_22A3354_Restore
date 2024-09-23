@implementation ReplicationXPCServerParametersRecord

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (NSString)description
{
  _TtC18ReplicatorServices36ReplicationXPCServerParametersRecord *v2;
  void *v3;

  v2 = self;
  ReplicationXPCServerParametersRecord.description.getter();

  v3 = (void *)sub_245443D78();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  sub_245407098(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))ReplicationXPCServerParametersRecord.encode(withBSXPCCoder:));
}

- (_TtC18ReplicatorServices36ReplicationXPCServerParametersRecord)initWithBSXPCCoder:(id)a3
{
  swift_unknownObjectRetain();
  return (_TtC18ReplicatorServices36ReplicationXPCServerParametersRecord *)ReplicationXPCServerParametersRecord.init(bsxpcCoder:)(a3);
}

- (_TtC18ReplicatorServices36ReplicationXPCServerParametersRecord)init
{
  _TtC18ReplicatorServices36ReplicationXPCServerParametersRecord *result;

  result = (_TtC18ReplicatorServices36ReplicationXPCServerParametersRecord *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_2453BA3A8((uint64_t)self + OBJC_IVAR____TtC18ReplicatorServices36ReplicationXPCServerParametersRecord_id, type metadata accessor for ReplicatorRecord.ID);
  v3 = (char *)self + OBJC_IVAR____TtC18ReplicatorServices36ReplicationXPCServerParametersRecord_version;
  v4 = sub_245443B14();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  sub_2453D055C((uint64_t)self + OBJC_IVAR____TtC18ReplicatorServices36ReplicationXPCServerParametersRecord_expiration, (uint64_t *)&unk_25440E420);
}

@end

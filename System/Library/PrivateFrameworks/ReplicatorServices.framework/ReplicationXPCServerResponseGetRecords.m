@implementation ReplicationXPCServerResponseGetRecords

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  sub_245407098(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))ReplicationXPCServerResponseGetRecords.encode(withBSXPCCoder:));
}

- (_TtC18ReplicatorServices38ReplicationXPCServerResponseGetRecords)initWithBSXPCCoder:(id)a3
{
  swift_unknownObjectRetain();
  return (_TtC18ReplicatorServices38ReplicationXPCServerResponseGetRecords *)ReplicationXPCServerResponseGetRecords.init(bsxpcCoder:)(a3);
}

- (_TtC18ReplicatorServices38ReplicationXPCServerResponseGetRecords)init
{
  _TtC18ReplicatorServices38ReplicationXPCServerResponseGetRecords *result;

  result = (_TtC18ReplicatorServices38ReplicationXPCServerResponseGetRecords *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end

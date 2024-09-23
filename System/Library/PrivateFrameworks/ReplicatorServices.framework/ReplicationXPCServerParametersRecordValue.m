@implementation ReplicationXPCServerParametersRecordValue

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
  sub_245407098(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))ReplicationXPCServerParametersRecordValue.encode(withBSXPCCoder:));
}

- (_TtC18ReplicatorServices41ReplicationXPCServerParametersRecordValue)initWithBSXPCCoder:(id)a3
{
  return (_TtC18ReplicatorServices41ReplicationXPCServerParametersRecordValue *)sub_2454018EC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_245407988);
}

- (_TtC18ReplicatorServices41ReplicationXPCServerParametersRecordValue)init
{
  _TtC18ReplicatorServices41ReplicationXPCServerParametersRecordValue *result;

  result = (_TtC18ReplicatorServices41ReplicationXPCServerParametersRecordValue *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2453BDCE4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC18ReplicatorServices41ReplicationXPCServerParametersRecordValue_data), *(_QWORD *)&self->version[OBJC_IVAR____TtC18ReplicatorServices41ReplicationXPCServerParametersRecordValue_data]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ReplicatorServices41ReplicationXPCServerParametersRecordValue_fileHandle));
  swift_bridgeObjectRelease();
}

@end

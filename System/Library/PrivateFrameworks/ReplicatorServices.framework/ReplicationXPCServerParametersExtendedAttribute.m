@implementation ReplicationXPCServerParametersExtendedAttribute

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
  sub_245407098(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))ReplicationXPCServerParametersExtendedAttribute.encode(withBSXPCCoder:));
}

- (_TtC18ReplicatorServices47ReplicationXPCServerParametersExtendedAttribute)initWithBSXPCCoder:(id)a3
{
  return (_TtC18ReplicatorServices47ReplicationXPCServerParametersExtendedAttribute *)sub_2454018EC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_245407698);
}

- (_TtC18ReplicatorServices47ReplicationXPCServerParametersExtendedAttribute)init
{
  _TtC18ReplicatorServices47ReplicationXPCServerParametersExtendedAttribute *result;

  result = (_TtC18ReplicatorServices47ReplicationXPCServerParametersExtendedAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_2453BDCE4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC18ReplicatorServices47ReplicationXPCServerParametersExtendedAttribute_data), *(_QWORD *)&self->name[OBJC_IVAR____TtC18ReplicatorServices47ReplicationXPCServerParametersExtendedAttribute_data]);
}

@end

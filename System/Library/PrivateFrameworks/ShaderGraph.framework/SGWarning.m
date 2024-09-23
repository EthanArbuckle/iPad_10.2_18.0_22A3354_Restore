@implementation SGWarning

- (NSString)message
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SGWarning_message);
  v3 = *(_QWORD *)&self->message[OBJC_IVAR___SGWarning_message];
  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x24954AF98](v2, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (SGWarning)init
{
  SGWarning *result;

  result = (SGWarning *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end

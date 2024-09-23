@implementation SMContributor

- (NSString)identifier
{
  return (NSString *)sub_24A7385E4(self, (uint64_t)a2, (void (*)(void))MEMORY[0x24BE88928]);
}

- (NSString)name
{
  return (NSString *)sub_24A7385E4(self, (uint64_t)a2, (void (*)(void))MEMORY[0x24BE88940]);
}

- (SMContributor)init
{
  SMContributor *result;

  result = (SMContributor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___SMContributor_contributor;
  v3 = sub_24A778AF4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end

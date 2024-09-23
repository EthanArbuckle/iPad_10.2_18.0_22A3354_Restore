@implementation SASelfLoggerVMCPUStats

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_255A5FAF0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_255A5FAF0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SASelfLoggerVMCPUStats *v5;

  v4 = a3;
  v5 = self;
  sub_229793AB8(v4);

}

- (SASelfLoggerVMCPUStats)initWithCoder:(id)a3
{
  id v3;
  SASelfLoggerVMCPUStats *v4;

  v3 = a3;
  v4 = (SASelfLoggerVMCPUStats *)sub_22979A2E8();

  return v4;
}

- (SASelfLoggerVMCPUStats)init
{
  SASelfLoggerVMCPUStats *result;

  result = (SASelfLoggerVMCPUStats *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___SASelfLoggerVMCPUStats_mwtId;
  v3 = sub_2297DBA98();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end

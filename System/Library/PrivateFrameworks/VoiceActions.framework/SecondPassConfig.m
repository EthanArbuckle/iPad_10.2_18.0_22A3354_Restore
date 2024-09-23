@implementation SecondPassConfig

- (BOOL)waitForFinal
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SecondPassConfig_waitForFinal;
  swift_beginAccess();
  return *v2;
}

- (void)setWaitForFinal:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SecondPassConfig_waitForFinal;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)useEndpointer
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SecondPassConfig_useEndpointer;
  swift_beginAccess();
  return *v2;
}

- (void)setUseEndpointer:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SecondPassConfig_useEndpointer;
  swift_beginAccess();
  *v4 = a3;
}

- (SecondPassConfig)init
{
  objc_super v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR___SecondPassConfig_waitForFinal) = 1;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___SecondPassConfig_useEndpointer) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SecondPassConfig();
  return -[SecondPassConfig init](&v3, sel_init);
}

- (NSString)description
{
  return (NSString *)sub_24A19E9F0(self, (uint64_t)a2, (void (*)(void))type metadata accessor for SecondPassConfig, &qword_25790DAE8, (uint64_t)&protocol conformance descriptor for SecondPassConfig);
}

@end

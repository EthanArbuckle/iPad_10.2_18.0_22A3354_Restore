@implementation RuntimeConfig

- (BOOL)audioDebug
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_audioDebug;
  swift_beginAccess();
  return *v2;
}

- (void)setAudioDebug:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_audioDebug;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)batchDecode
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_batchDecode;
  swift_beginAccess();
  return *v2;
}

- (void)setBatchDecode:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_batchDecode;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)preKeywordSilence
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_preKeywordSilence;
  swift_beginAccess();
  return *v2;
}

- (void)setPreKeywordSilence:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_preKeywordSilence;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)duringKeywordSilence
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_duringKeywordSilence;
  swift_beginAccess();
  return *v2;
}

- (void)setDuringKeywordSilence:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_duringKeywordSilence;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)postKeywordSilence
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_postKeywordSilence;
  swift_beginAccess();
  return *v2;
}

- (void)setPostKeywordSilence:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_postKeywordSilence;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)secondPass
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_secondPass;
  swift_beginAccess();
  return *v2;
}

- (void)setSecondPass:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___RuntimeConfig_secondPass;
  swift_beginAccess();
  *v4 = a3;
}

- (RuntimeConfig)init
{
  objc_super v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR___RuntimeConfig_audioDebug) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___RuntimeConfig_batchDecode) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___RuntimeConfig_preKeywordSilence) = 1;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___RuntimeConfig_duringKeywordSilence) = 1;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___RuntimeConfig_postKeywordSilence) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___RuntimeConfig_secondPass) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RuntimeConfig();
  return -[RuntimeConfig init](&v3, sel_init);
}

- (NSString)description
{
  return (NSString *)sub_24A19E9F0(self, (uint64_t)a2, (void (*)(void))type metadata accessor for RuntimeConfig, &qword_25790DCC8, (uint64_t)&protocol conformance descriptor for RuntimeConfig);
}

@end

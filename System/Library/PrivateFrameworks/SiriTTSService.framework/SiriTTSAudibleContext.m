@implementation SiriTTSAudibleContext

- (unsigned)audioSessionId
{
  unsigned int result;

  sub_19AD69D90();
  return result;
}

- (void)setAudioSessionId:(unsigned int)a3
{
  sub_19AD69DE8(a3);
}

- (BOOL)immediate
{
  char v2;

  sub_19AD69E84();
  return v2 & 1;
}

- (void)setImmediate:(BOOL)a3
{
  sub_19AD69EDC(a3);
}

- (id)didStartSpeaking
{
  return sub_19AD6C3E0((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))sub_19AD69F70, (uint64_t)sub_19AD493AC, (uint64_t)&block_descriptor_228);
}

- (void)setDidStartSpeaking:(id)a3
{
  void *v4;
  uint64_t v5;
  SiriTTSAudibleContext *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_19AD77E14;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_19AD6A00C((uint64_t)v4, v5);

}

- (float)playbackVolume
{
  float result;

  sub_19AD6A160();
  return result;
}

- (void)setPlaybackVolume:(float)a3
{
  sub_19AD6A1B4(a3);
}

- (SiriTTSAudibleContext)init
{
  SiriTTSAudibleContext *result;

  AudibleContext.init()();
  return result;
}

+ (BOOL)supportsSecureCoding
{
  char v2;

  static AudibleContext.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static AudibleContext.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SiriTTSAudibleContext *v5;

  v4 = a3;
  v5 = self;
  sub_19AD6A3BC();

}

- (SiriTTSAudibleContext)initWithCoder:(id)a3
{
  return (SiriTTSAudibleContext *)AudibleContext.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_19AD75C30(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SiriTTSAudibleContext_didStartSpeaking));
}

@end

@implementation SiriTTSSynthesisContext

- (NSString)text
{
  return (NSString *)sub_19AD712E4((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))sub_19AD6B8DC);
}

- (void)setText:(id)a3
{
  sub_19AD71328(self);
}

- (SiriTTSSynthesisVoice)voice
{
  return (SiriTTSSynthesisVoice *)sub_19AD6B95C();
}

- (void)setVoice:(id)a3
{
  id v4;
  SiriTTSSynthesisContext *v5;

  v4 = a3;
  v5 = self;
  sub_19AD6B9D8(v4);

}

- (BOOL)privacySensitive
{
  char v2;

  sub_19AD6BA6C();
  return v2 & 1;
}

- (void)setPrivacySensitive:(BOOL)a3
{
  sub_19AD6BAC4(a3);
}

- (BOOL)minimizeDeviceUsage
{
  char v2;

  sub_19AD6BB60();
  return v2 & 1;
}

- (void)setMinimizeDeviceUsage:(BOOL)a3
{
  sub_19AD6BBB8(a3);
}

- (NSDictionary)contextInfo
{
  uint64_t v2;
  void *v3;

  sub_19AD6BC88();
  if (v2)
  {
    v3 = (void *)sub_19AE5537C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSDictionary *)v3;
}

- (void)setContextInfo:(id)a3
{
  SiriTTSSynthesisContext *v4;

  if (a3)
    sub_19AE553A0();
  v4 = self;
  sub_19AD6BD00();

}

- (float)rate
{
  float result;

  sub_19AD6BD90();
  return result;
}

- (void)setRate:(float)a3
{
  sub_19AD6BDE4(a3);
}

- (float)pitch
{
  float result;

  sub_19AD6BE80();
  return result;
}

- (void)setPitch:(float)a3
{
  sub_19AD6BED4(a3);
}

- (float)volume
{
  float result;

  sub_19AD6BF70();
  return result;
}

- (void)setVolume:(float)a3
{
  sub_19AD6BFC4(a3);
}

- (NSArray)customResourceURLs
{
  uint64_t v2;
  void *v3;

  sub_19AD6C094();
  if (v2)
  {
    sub_19AE54EB4();
    v3 = (void *)sub_19AE55664();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (void)setCustomResourceURLs:(id)a3
{
  SiriTTSSynthesisContext *v4;

  if (a3)
  {
    sub_19AE54EB4();
    sub_19AE5567C();
  }
  v4 = self;
  sub_19AD6C134();

}

- (int64_t)synthesisProfile
{
  int64_t result;

  sub_19AD6C200();
  return result;
}

- (void)setSynthesisProfile:(int64_t)a3
{
  sub_19AD6C258(a3);
}

- (BOOL)disableCompactVoice
{
  char v2;

  sub_19AD6C2F4();
  return v2 & 1;
}

- (void)setDisableCompactVoice:(BOOL)a3
{
  sub_19AD6C34C(a3);
}

- (id)didGenerateAudio
{
  return sub_19AD6C3E0((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))sub_19AD6C458, (uint64_t)sub_19AD6C46C, (uint64_t)&block_descriptor_222);
}

- (void)setDidGenerateAudio:(id)a3
{
  void *v4;
  uint64_t v5;
  SiriTTSSynthesisContext *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_19AD78028;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_19AD6C4F8((uint64_t)v4, v5);

}

- (id)didGenerateWordTimings
{
  return sub_19AD6C3E0((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))sub_19AD6C648, (uint64_t)sub_19AD6C65C, (uint64_t)&block_descriptor_216);
}

- (void)setDidGenerateWordTimings:(id)a3
{
  void *v4;
  uint64_t v5;
  SiriTTSSynthesisContext *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_19AD77E0C;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_19AD6C78C((uint64_t)v4, v5);

}

- (BOOL)whisper
{
  char v2;

  sub_19AD6C8E4();
  return v2 & 1;
}

- (void)setWhisper:(BOOL)a3
{
  sub_19AD6C93C(a3);
}

- (SiriTTSProsodyProperties)prosodyProperties
{
  return (SiriTTSProsodyProperties *)sub_19AD6C9D4();
}

- (void)setProsodyProperties:(id)a3
{
  id v4;
  SiriTTSSynthesisContext *v5;

  v4 = a3;
  v5 = self;
  sub_19AD6CA50(v4);

}

- (BOOL)forceOspreyTTS
{
  char v2;

  sub_19AD6CAE4();
  return v2 & 1;
}

- (void)setForceOspreyTTS:(BOOL)a3
{
  sub_19AD6CB3C(a3);
}

+ (BOOL)supportsSecureCoding
{
  char v2;

  static SynthesisContext.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static SynthesisContext.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SiriTTSSynthesisContext *v5;

  v4 = a3;
  v5 = self;
  sub_19AD6CDE4();

}

- (SiriTTSSynthesisContext)initWithCoder:(id)a3
{
  return (SiriTTSSynthesisContext *)SynthesisContext.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)sub_19AD75A78(self, (uint64_t)a2, (void (*)(void))sub_19AD6D850);
}

- (SiriTTSSynthesisContext)init
{
  SynthesisContext.init()();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_76();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_232(OBJC_IVAR___SiriTTSSynthesisContext_didGenerateAudio);
  OUTLINED_FUNCTION_232(OBJC_IVAR___SiriTTSSynthesisContext_didGenerateWordTimings);
  OUTLINED_FUNCTION_23_3(*(id *)((char *)&self->super.isa + OBJC_IVAR___SiriTTSSynthesisContext_prosodyProperties));
}

@end

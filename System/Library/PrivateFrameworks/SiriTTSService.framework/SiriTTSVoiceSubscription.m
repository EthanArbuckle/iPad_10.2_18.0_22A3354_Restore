@implementation SiriTTSVoiceSubscription

- (SiriTTSSynthesisVoice)voice
{
  return (SiriTTSSynthesisVoice *)sub_19AE14F98();
}

- (void)setVoice:(id)a3
{
  id v4;
  SiriTTSVoiceSubscription *v5;

  v4 = a3;
  v5 = self;
  sub_19AE15020();

}

- (NSString)clientId
{
  return (NSString *)sub_19AE15DF0(self, (uint64_t)a2, sub_19AE150CC);
}

- (void)setClientId:(id)a3
{
  SiriTTSVoiceSubscription *v4;

  sub_19AE55448();
  v4 = self;
  sub_19AE1516C();

}

- (NSString)accessoryId
{
  return (NSString *)sub_19AE1159C(self, (uint64_t)a2, sub_19AE15230);
}

- (void)setAccessoryId:(id)a3
{
  sub_19AE115EC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_19AE15248);
}

- (SiriTTSVoiceSubscription)initWithVoice:(id)a3 clientId:(id)a4 accessoryId:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7 = sub_19AE55448();
  v9 = v8;
  if (a5)
  {
    a5 = (id)sub_19AE55448();
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  return (SiriTTSVoiceSubscription *)SynthesisVoiceSubscription.init(voice:clientId:accessoryId:)(a3, v7, v9, (uint64_t)a5, v11);
}

- (BOOL)isEqual:(id)a3
{
  SiriTTSVoiceSubscription *v4;
  SiriTTSVoiceSubscription *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_19AE55A6C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_19AE153B8((uint64_t)v8);

  sub_19AD567C8((uint64_t)v8, (uint64_t *)&unk_1ED05B470);
  return v6 & 1;
}

- (int64_t)hash
{
  SiriTTSVoiceSubscription *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_19AE15640();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  char v2;

  static SynthesisVoiceSubscription.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static SynthesisVoiceSubscription.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SiriTTSVoiceSubscription *v5;

  v4 = a3;
  v5 = self;
  sub_19AE15834(v4);

}

- (SiriTTSVoiceSubscription)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (SiriTTSVoiceSubscription *)SynthesisVoiceSubscription.init(coder:)();
}

- (NSString)description
{
  return (NSString *)sub_19AE16280(self, (uint64_t)a2, (void (*)(void))sub_19AE15BB8);
}

- (SiriTTSVoiceSubscription)init
{
  SynthesisVoiceSubscription.init()();
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_147_0();
  OUTLINED_FUNCTION_224_0(OBJC_IVAR___SiriTTSVoiceSubscription_accessoryId);
  OUTLINED_FUNCTION_41_1();
}

@end

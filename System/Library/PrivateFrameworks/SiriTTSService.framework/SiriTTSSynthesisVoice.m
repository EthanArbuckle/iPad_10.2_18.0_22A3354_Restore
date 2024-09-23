@implementation SiriTTSSynthesisVoice

- (NSString)language
{
  return (NSString *)sub_19AD712E4((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))sub_19AD7392C);
}

- (void)setLanguage:(id)a3
{
  sub_19AD71328(self);
}

- (NSString)name
{
  return (NSString *)sub_19AD73998((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))sub_19AD739D0);
}

- (void)setName:(id)a3
{
  sub_19AD73A24(self, (uint64_t)a2, (uint64_t)a3);
}

- (int64_t)footprint
{
  int64_t result;

  sub_19AD73B40();
  return result;
}

- (void)setFootprint:(int64_t)a3
{
  sub_19AD73B98(a3);
}

- (int64_t)type
{
  int64_t result;

  sub_19AD73CB0();
  return result;
}

- (void)setType:(int64_t)a3
{
  sub_19AD73D08(a3);
}

- (int64_t)gender
{
  int64_t result;

  sub_19AD73DE4();
  return result;
}

- (void)setGender:(int64_t)a3
{
  sub_19AD73E3C(a3);
}

- (int64_t)version
{
  int64_t result;

  sub_19AD73ED4();
  return result;
}

- (void)setVersion:(int64_t)a3
{
  sub_19AD73F2C(a3);
}

- (SiriTTSSynthesisVoice)initWithLanguage:(id)a3 name:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = sub_19AE55448();
  v7 = v6;
  if (a4)
  {
    v8 = sub_19AE55448();
    v10 = v9;
  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  return (SiriTTSSynthesisVoice *)SynthesisVoice.init(language:name:)(v5, v7, v8, v10);
}

- (BOOL)isEqual:(id)a3
{
  return sub_19AD742E8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_19AD740F0);
}

- (int64_t)hash
{
  SiriTTSSynthesisVoice *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_19AD7439C();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  char v2;

  static SynthesisVoice.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static SynthesisVoice.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SiriTTSSynthesisVoice *v5;

  v4 = a3;
  v5 = self;
  sub_19AD745AC();

}

- (SiriTTSSynthesisVoice)initWithCoder:(id)a3
{
  return (SiriTTSSynthesisVoice *)SynthesisVoice.init(coder:)((uint64_t)a3);
}

- (NSString)description
{
  return (NSString *)sub_19AD75A78(self, (uint64_t)a2, (void (*)(void))sub_19AD74A60);
}

- (NSString)assetKey
{
  return (NSString *)sub_19AD75A78(self, (uint64_t)a2, (void (*)(void))sub_19AD74C20);
}

- (SiriTTSSynthesisVoice)init
{
  SynthesisVoice.init()();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_41_1();
}

+ (int)voiceEnumForName:(id)a3
{
  uint64_t v3;
  int v4;

  v3 = sub_19AE55448();
  v4 = static SynthesisVoice.voiceEnum(forName:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

@end

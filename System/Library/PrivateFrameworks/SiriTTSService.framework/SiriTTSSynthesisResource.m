@implementation SiriTTSSynthesisResource

- (NSString)language
{
  return (NSString *)sub_19AD712E4((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))sub_19AD75498);
}

- (void)setLanguage:(id)a3
{
  sub_19AD71328(self);
}

- (int64_t)version
{
  int64_t result;

  sub_19AD75518();
  return result;
}

- (void)setVersion:(int64_t)a3
{
  sub_19AD75570(a3);
}

- (SiriTTSSynthesisResource)initWithLanguage:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  SiriTTSSynthesisResource *result;

  v3 = sub_19AE55448();
  SynthesisResource.init(language:)(v3, v4);
  return result;
}

- (NSString)description
{
  return (NSString *)sub_19AD75A78(self, (uint64_t)a2, (void (*)(void))sub_19AD75690);
}

+ (BOOL)supportsSecureCoding
{
  char v2;

  static SynthesisResource.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static SynthesisResource.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SiriTTSSynthesisResource *v5;

  v4 = a3;
  v5 = self;
  sub_19AD75838();

}

- (SiriTTSSynthesisResource)initWithCoder:(id)a3
{
  return (SiriTTSSynthesisResource *)SynthesisResource.init(coder:)(a3);
}

- (NSString)assetKey
{
  return (NSString *)sub_19AD75A78(self, (uint64_t)a2, (void (*)(void))sub_19AD75AB4);
}

- (SiriTTSSynthesisResource)init
{
  SynthesisResource.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end

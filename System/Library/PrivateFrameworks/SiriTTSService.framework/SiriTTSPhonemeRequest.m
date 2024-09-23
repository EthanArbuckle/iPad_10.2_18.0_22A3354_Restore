@implementation SiriTTSPhonemeRequest

- (NSString)text
{
  return (NSString *)sub_19AD712E4((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))sub_19AD71310);
}

- (void)setText:(id)a3
{
  sub_19AD71328(self);
}

- (SiriTTSSynthesisVoice)voice
{
  return (SiriTTSSynthesisVoice *)sub_19AD713CC();
}

- (void)setVoice:(id)a3
{
  id v4;
  SiriTTSPhonemeRequest *v5;

  v4 = a3;
  v5 = self;
  sub_19AD71448(v4);

}

- (int64_t)phonemeSystem
{
  int64_t result;

  sub_19AD714DC();
  return result;
}

- (void)setPhonemeSystem:(int64_t)a3
{
  sub_19AD71534(a3);
}

- (SiriTTSPhonemeRequest)initWithText:(id)a3 voice:(id)a4 phonemeSystem:(int64_t)a5
{
  uint64_t v7;
  uint64_t v8;
  SiriTTSPhonemeRequest *result;

  v7 = sub_19AE55448();
  PhonemeRequest.init(text:voice:phonemeSystem:)(v7, v8, (uint64_t)a4, a5);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SiriTTSPhonemeRequest *v5;

  v4 = a3;
  v5 = self;
  sub_19AD716A0();

}

- (SiriTTSPhonemeRequest)initWithCoder:(id)a3
{
  SiriTTSPhonemeRequest *result;

  PhonemeRequest.init(coder:)(a3);
  return result;
}

- (NSString)description
{
  return (NSString *)sub_19AD75A78(self, (uint64_t)a2, sub_19AD71908);
}

- (SiriTTSPhonemeRequest)init
{
  sub_19AD71AF4();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_23_3(*(id *)((char *)&self->super.super.isa + OBJC_IVAR___SiriTTSPhonemeRequest_voice));
}

@end

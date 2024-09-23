@implementation SiriTTSAudioHintRequest

- (SiriTTSAudibleContext)audibleContext
{
  return (SiriTTSAudibleContext *)sub_19AD72D70();
}

- (void)setAudibleContext:(id)a3
{
  id v4;
  SiriTTSAudioHintRequest *v5;

  v4 = a3;
  v5 = self;
  sub_19AD72DEC(v4);

}

- (SiriTTSSynthesisVoice)voice
{
  return (SiriTTSSynthesisVoice *)sub_19AD72E7C();
}

- (void)setVoice:(id)a3
{
  id v4;
  SiriTTSAudioHintRequest *v5;

  v4 = a3;
  v5 = self;
  sub_19AD72EF8(v4);

}

- (int64_t)dialogNumber
{
  int64_t result;

  sub_19AD72FC8();
  return result;
}

- (void)setDialogNumber:(int64_t)a3
{
  sub_19AD73020(a3);
}

- (BOOL)useCompactHints
{
  char v2;

  sub_19AD730BC();
  return v2 & 1;
}

- (void)setUseCompactHints:(BOOL)a3
{
  sub_19AD73114(a3);
}

- (SiriTTSAudioHintRequest)initWithVoice:(id)a3 dialogNumber:(int64_t)a4 useCompactHints:(BOOL)a5
{
  return (SiriTTSAudioHintRequest *)AudioHintRequest.init(voice:dialogNumber:useCompactHints:)(a3);
}

- (BOOL)isValid
{
  SiriTTSAudioHintRequest *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_19AD73388();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SiriTTSAudioHintRequest *v5;

  v4 = a3;
  v5 = self;
  sub_19AD73404();

}

- (SiriTTSAudioHintRequest)initWithCoder:(id)a3
{
  id v3;
  SiriTTSAudioHintRequest *result;

  v3 = a3;
  AudioHintRequest.init(coder:)();
  return result;
}

- (NSString)description
{
  return (NSString *)sub_19AD75A78(self, (uint64_t)a2, sub_19AD736A8);
}

- (SiriTTSAudioHintRequest)init
{
  sub_19AD7388C();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_163((uint64_t)self, OBJC_IVAR___SiriTTSAudioHintRequest_audibleContext);
  OUTLINED_FUNCTION_23_3(*(id *)((char *)&self->super.super.isa + OBJC_IVAR___SiriTTSAudioHintRequest_voice));
}

@end

@implementation StartSpeechDictationRequestMessage

- (NSString)description
{
  return (NSString *)sub_2468FAB9C(self, (uint64_t)a2, (void (*)(void))sub_2469CE4FC);
}

- (NSString)debugDescription
{
  return (NSString *)sub_2468FAB9C(self, (uint64_t)a2, (void (*)(void))sub_2468FABF4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16SiriMessageTypes34StartSpeechDictationRequestMessage_dictationOptions));
}

@end

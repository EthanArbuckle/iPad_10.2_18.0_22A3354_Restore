@implementation AsrResultCandidateMessage

- (NSString)description
{
  return (NSString *)sub_2468FF3B8(self, (uint64_t)a2, (void (*)(void))sub_2468FF1EC);
}

- (NSString)debugDescription
{
  return (NSString *)sub_2468FF3B8(self, (uint64_t)a2, (void (*)(void))sub_2468FABF4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16SiriMessageTypes25AsrResultCandidateMessage_speechPackage));
}

@end

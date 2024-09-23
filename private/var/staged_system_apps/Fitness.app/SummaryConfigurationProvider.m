@implementation SummaryConfigurationProvider

- (_TtC10FitnessApp28SummaryConfigurationProvider)init
{
  return (_TtC10FitnessApp28SummaryConfigurationProvider *)sub_1000EA8D8();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp28SummaryConfigurationProvider__currentCardConfiguration;
  v4 = sub_100047110(&qword_10081F3E0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10FitnessApp28SummaryConfigurationProvider_userRemovedCardTypes));
}

@end

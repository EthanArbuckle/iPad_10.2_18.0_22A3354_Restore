@implementation ScanTurnsSubscriber

- (void)receiveSubscription:(id)a3
{
  id v4;
  _TtC28SiriPrivateLearningAnalyticsP33_95987ADD223C83697EEA450CF0CC3A3519ScanTurnsSubscriber *v5;

  v4 = a3;
  v5 = self;
  sub_1CB7DFDBC(v4);

}

- (int64_t)receiveInput:(id)a3
{
  _TtC28SiriPrivateLearningAnalyticsP33_95987ADD223C83697EEA450CF0CC3A3519ScanTurnsSubscriber *v4;
  int64_t v5;
  _BYTE v7[32];

  swift_unknownObjectRetain();
  v4 = self;
  sub_1CB846EB8();
  swift_unknownObjectRelease();
  v5 = sub_1CB7DFEC0((uint64_t)v7);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5;
}

- (void)receiveCompletion:(id)a3
{
  id v4;
  _TtC28SiriPrivateLearningAnalyticsP33_95987ADD223C83697EEA450CF0CC3A3519ScanTurnsSubscriber *v5;

  v4 = a3;
  v5 = self;
  sub_1CB7E0698(v4);

}

- (void)cancel
{
  _TtC28SiriPrivateLearningAnalyticsP33_95987ADD223C83697EEA450CF0CC3A3519ScanTurnsSubscriber *v2;

  v2 = self;
  sub_1CB7E08BC();

}

- (_TtC28SiriPrivateLearningAnalyticsP33_95987ADD223C83697EEA450CF0CC3A3519ScanTurnsSubscriber)init
{
  _TtC28SiriPrivateLearningAnalyticsP33_95987ADD223C83697EEA450CF0CC3A3519ScanTurnsSubscriber *result;

  result = (_TtC28SiriPrivateLearningAnalyticsP33_95987ADD223C83697EEA450CF0CC3A3519ScanTurnsSubscriber *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  v3 = (char *)self
     + OBJC_IVAR____TtC28SiriPrivateLearningAnalyticsP33_95987ADD223C83697EEA450CF0CC3A3519ScanTurnsSubscriber_turnsStartDateTime;
  v4 = sub_1CB846018();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28SiriPrivateLearningAnalyticsP33_95987ADD223C83697EEA450CF0CC3A3519ScanTurnsSubscriber_innerSubscription));
  swift_release();
  swift_release();
  sub_1CB785B54((uint64_t)self+ OBJC_IVAR____TtC28SiriPrivateLearningAnalyticsP33_95987ADD223C83697EEA450CF0CC3A3519ScanTurnsSubscriber_previousTurnId, &qword_1ED88D570);
}

@end

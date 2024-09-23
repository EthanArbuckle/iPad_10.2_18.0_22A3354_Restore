@implementation SiriUserFeedbackLearningPluginBase

- (_TtC28SiriPrivateLearningAnalytics34SiriUserFeedbackLearningPluginBase)init
{
  char *v2;
  uint64_t v3;
  _TtC28SiriPrivateLearningAnalytics34SiriUserFeedbackLearningPluginBase *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v2 = (char *)self + OBJC_IVAR____TtC28SiriPrivateLearningAnalytics34SiriUserFeedbackLearningPluginBase_usageLogger;
  *((_QWORD *)v2 + 3) = &type metadata for UsageLogger;
  *((_QWORD *)v2 + 4) = &protocol witness table for UsageLogger;
  v3 = qword_1ED8891D0;
  v4 = self;
  if (v3 != -1)
    swift_once();
  v5 = sub_1CB84672C();
  v6 = __swift_project_value_buffer(v5, (uint64_t)qword_1ED8891B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))((uint64_t)v4 + OBJC_IVAR____TtC28SiriPrivateLearningAnalytics34SiriUserFeedbackLearningPluginBase_timeout, v6, v5);

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for SiriUserFeedbackLearningPluginBase();
  return -[SiriUserFeedbackLearningPluginBase init](&v8, sel_init);
}

- (id)performTask:(id)a3 error:(id *)a4
{
  id v5;
  _TtC28SiriPrivateLearningAnalytics34SiriUserFeedbackLearningPluginBase *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_1CB81FCFC(v5);

  return v7;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC28SiriPrivateLearningAnalytics34SiriUserFeedbackLearningPluginBase_usageLogger);
  v3 = (char *)self + OBJC_IVAR____TtC28SiriPrivateLearningAnalytics34SiriUserFeedbackLearningPluginBase_timeout;
  v4 = sub_1CB84672C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end

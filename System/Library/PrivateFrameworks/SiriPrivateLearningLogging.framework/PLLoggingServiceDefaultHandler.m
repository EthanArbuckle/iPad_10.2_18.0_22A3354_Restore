@implementation PLLoggingServiceDefaultHandler

- (void)storeInstrumentationWithEvents:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC26SiriPrivateLearningLogging30PLLoggingServiceDefaultHandler *v8;

  v5 = _Block_copy(a4);
  sub_21188F338(0, (unint64_t *)&qword_254AC4998);
  v6 = sub_2118967A0();
  if (v5)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v5;
    v5 = sub_211895934;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_211895804(v6, v5, v7);
  sub_21188DD70((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (_TtC26SiriPrivateLearningLogging30PLLoggingServiceDefaultHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PLLoggingServiceDefaultHandler();
  return -[PLLoggingServiceDefaultHandler init](&v3, sel_init);
}

@end

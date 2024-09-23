@implementation SchedulerTrampoline

- (void)schedulePublishWakeWithInformation:(id)a3 completion:(id)a4
{
  void (**v6)(void *, void *);
  unint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  _TtC12searchpartydP33_8F16B571022752B5A0333344EAF60C1619SchedulerTrampoline *v11;

  v6 = (void (**)(void *, void *))_Block_copy(a4);
  v7 = sub_100619A5C();
  v8 = swift_allocError(&type metadata for SchedulerTrampoline.Error, v7, 0, 0);
  v9 = a3;
  v11 = self;
  v10 = (void *)_convertErrorToNSError(_:)(v8);
  v6[2](v6, v10);

  swift_errorRelease(v8);
  _Block_release(v6);

}

- (void)publishImmediatelyWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12searchpartydP33_8F16B571022752B5A0333344EAF60C1619SchedulerTrampoline *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1010837B8, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1006197D8((uint64_t)sub_10015A53C, v5);

  swift_release();
}

- (_TtC12searchpartydP33_8F16B571022752B5A0333344EAF60C1619SchedulerTrampoline)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SchedulerTrampoline();
  return -[SchedulerTrampoline init](&v3, "init");
}

@end

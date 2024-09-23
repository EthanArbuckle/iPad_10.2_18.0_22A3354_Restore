@implementation PLLoggingServiceStore

- (PLLoggingServiceStore)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLLoggingServiceStore;
  return -[PLLoggingServiceStore init](&v3, sel_init);
}

+ (PLLoggingServiceStore)sharedInstance
{
  if (qword_254AC47B8 != -1)
    swift_once();
  return (PLLoggingServiceStore *)(id)qword_254AC4990;
}

- (void)storeInstrumentationWithEvents:(id)a3 completion:(id)a4
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PLLoggingServiceStore *v9;

  v5 = _Block_copy(a4);
  sub_21188DD34();
  v6 = sub_2118967A0();
  if (v5)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v5;
    v5 = sub_21188DDA4;
  }
  else
  {
    v7 = 0;
  }
  v8 = qword_254AC47D8;
  v9 = self;
  if (v8 != -1)
    swift_once();
  sub_211895DB8(v6, (uint64_t)v5, v7);
  sub_21188DD70((uint64_t)v5);

  swift_bridgeObjectRelease();
}

@end

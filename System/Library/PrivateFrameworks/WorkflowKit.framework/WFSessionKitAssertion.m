@implementation WFSessionKitAssertion

- (id)resultHandler
{
  return sub_1C179D5D0((uint64_t)self, (uint64_t)a2, SessionKitAssertion.resultHandler.getter, (uint64_t)sub_1C179D114, (uint64_t)&block_descriptor_36);
}

- (void)setResultHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  WFSessionKitAssertion *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1C17A111C;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  SessionKitAssertion.resultHandler.setter((uint64_t)v4, v5);

}

- (id)failureHandler
{
  return sub_1C179D5D0((uint64_t)self, (uint64_t)a2, SessionKitAssertion.failureHandler.getter, (uint64_t)sub_1C179D6B8, (uint64_t)&block_descriptor_16);
}

- (void)setFailureHandler:(id)a3
{
  uint64_t (*v4)();
  uint64_t v5;
  WFSessionKitAssertion *v6;

  v4 = (uint64_t (*)())_Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1C17A4370;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  SessionKitAssertion.failureHandler.setter((uint64_t)v4, v5);

}

- (WFSessionKitAssertion)initWithBundleIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1C1B0F224();
  return (WFSessionKitAssertion *)SessionKitAssertion.init(bundleIdentifier:)(v3, v4);
}

- (WFSessionKitAssertion)initWithSessionIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1C1B0F224();
  return (WFSessionKitAssertion *)SessionKitAssertion.init(sessionIdentifier:)(v3, v4);
}

- (BOOL)takeWithError:(id *)a3
{
  WFSessionKitAssertion *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = self;
  SessionKitAssertion.take()();

  if (v5)
  {
    if (a3)
    {
      v6 = (void *)sub_1C1B0DBA4();

      v7 = v6;
      *a3 = v6;
    }
    else
    {

    }
  }
  return v5 == 0;
}

- (void)startTimeoutTimer
{
  WFSessionKitAssertion *v2;

  v2 = self;
  SessionKitAssertion.startTimeoutTimer()();

}

- (void)cancel
{
  WFSessionKitAssertion *v2;

  v2 = self;
  SessionKitAssertion.cancel()();

}

- (void)dealloc
{
  WFSessionKitAssertion *v2;

  v2 = self;
  SessionKitAssertion.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_1C16EA830(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSessionKitAssertion_resultHandler));
  sub_1C16EA830(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSessionKitAssertion_failureHandler));
  sub_1C17A0D28();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (WFSessionKitAssertion)init
{
  SessionKitAssertion.init()();
}

- (void)addCompletionHandlerIfRunning:(id)a3
{
  void *v4;
  WFSessionKitAssertion *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1C179FC94((uint64_t)v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);

}

@end

@implementation WFRunnerConnection

- (int64_t)targetType
{
  return sub_1AF698E38();
}

- (id)onInterruption
{
  return sub_1AF6990E8((uint64_t)self, (uint64_t)a2, RunnerConnection.onInterruption.getter, (uint64_t)&block_descriptor_18);
}

- (void)setOnInterruption:(id)a3
{
  void *v4;
  uint64_t v5;
  WFRunnerConnection *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1AF69B1C0;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  RunnerConnection.onInterruption.setter((uint64_t)v4, v5);

}

- (id)onInvalidation
{
  return sub_1AF6990E8((uint64_t)self, (uint64_t)a2, RunnerConnection.onInvalidation.getter, (uint64_t)&block_descriptor);
}

- (void)setOnInvalidation:(id)a3
{
  void *v4;
  uint64_t v5;
  WFRunnerConnection *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1AF69B1C0;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  RunnerConnection.onInvalidation.setter((uint64_t)v4, v5);

}

- (WFRunnerConnection)initWithRunDescriptor:(id)a3 host:(id)a4 onInterruption:(id)a5 onInvalidation:(id)a6
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v9 = _Block_copy(a5);
  v10 = _Block_copy(a6);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v9;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v10;
  v13 = a3;
  swift_unknownObjectRetain();
  return (WFRunnerConnection *)RunnerConnection.init(runDescriptor:host:onInterruption:onInvalidation:)(a3, (uint64_t)a4, (uint64_t)sub_1AF69AF04, v11, (uint64_t)sub_1AF69B1C0, v12);
}

- (id)asyncRunnerWithReason:(id)a3 error:(id *)a4
{
  return sub_1AF699AD4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))RunnerConnection.asyncRunner(reason:));
}

- (id)syncRunnerWithReason:(id)a3 error:(id *)a4
{
  return sub_1AF699AD4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))RunnerConnection.syncRunner(reason:));
}

- (void)invalidate
{
  WFRunnerConnection *v2;

  v2 = self;
  RunnerConnection.invalidate()();

}

- (WFRunnerConnection)init
{
  RunnerConnection.init()();
}

- (void).cxx_destruct
{
  sub_1AF69AF28((uint64_t)self + OBJC_IVAR___WFRunnerConnection_host);
  sub_1AF6995F0(*(id *)((char *)&self->super.isa + OBJC_IVAR___WFRunnerConnection_connection), self->policy[OBJC_IVAR___WFRunnerConnection_connection]);
  sub_1AF698F38(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFRunnerConnection_onInterruption));
  sub_1AF698F38(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFRunnerConnection_onInvalidation));
}

@end

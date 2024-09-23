@implementation BatchActionExecutor

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  self;
  sub_1C1784678();
}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  self;
  sub_1C17846EC();
}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  self;
  sub_1C1784760();
}

- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5
{
  id v8;
  _TtC11WorkflowKit19BatchActionExecutor *v9;
  id v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = self;
  v10 = a5;
  sub_1C1784840((uint64_t)v10, a4, a5);

}

- (void)executor:(id)a3 needsAppProtectionUnlockWithCompletionHandler:(id)a4
{
  void *v6;
  id v7;
  _TtC11WorkflowKit19BatchActionExecutor *v8;

  v6 = _Block_copy(a4);
  *(_QWORD *)(swift_allocObject() + 16) = v6;
  v7 = a3;
  v8 = self;
  sub_1C1784C04();
}

- (_TtC11WorkflowKit19BatchActionExecutor)init
{
  sub_1C1784DB8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectWeakDestroy();
  sub_1C1606884((uint64_t)self + OBJC_IVAR____TtC11WorkflowKit19BatchActionExecutor_provider);
  sub_1C17850D8((uint64_t)self + OBJC_IVAR____TtC11WorkflowKit19BatchActionExecutor_continuation);
}

@end

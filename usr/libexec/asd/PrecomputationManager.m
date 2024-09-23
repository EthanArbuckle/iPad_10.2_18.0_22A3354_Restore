@implementation PrecomputationManager

+ (_TtC3asd21PrecomputationManager)shared
{
  return (_TtC3asd21PrecomputationManager *)static PrecomputationManager.shared.getter();
}

- (_TtC3asd21PrecomputationManager)init
{
  return (_TtC3asd21PrecomputationManager *)PrecomputationManager.init()();
}

- (void)triggerDuePrecomputationsWithDataProtectionClass:(int64_t)a3 shouldDefer:(id)a4 completionHandler:
{
  const void *v4;
  const void *v5;
  void *v8;
  void *v9;
  _QWORD *v10;
  _TtC3asd21PrecomputationManager *v11;

  v5 = v4;
  v8 = _Block_copy(a4);
  v9 = _Block_copy(v5);
  v10 = (_QWORD *)swift_allocObject(&unk_1004D0CD8, 48, 7);
  v10[2] = a3;
  v10[3] = v8;
  v10[4] = v9;
  v10[5] = self;
  v11 = self;
  sub_10008F82C((uint64_t)&unk_100504380, (uint64_t)v10);
}

- (void)triggerAllPrecomputationsWithCompletionHandler:(id)a3
{
  sub_10004D9F8(self, (int)a2, a3, (uint64_t)&unk_1004D0CB0);
}

- (void)triggerPrecomputationWithWorkflowID:(NSString *)a3 completionHandler:(id)a4
{
  sub_10004D6A8(self, (int)a2, a3, a4, (uint64_t)&unk_1004D0C88);
}

- (void)triggerPregenerationWithWorkflowID:(NSString *)a3 completionHandler:(id)a4
{
  sub_10004D6A8(self, (int)a2, a3, a4, (uint64_t)&unk_1004D0C60);
}

- (void)notifyCachesWereRemovedWithCompletionHandler:(id)a3
{
  sub_10004D9F8(self, (int)a2, a3, (uint64_t)&unk_1004D0C38);
}

- (void)pausePrecomputationsWithCompletionHandler:(id)a3
{
  sub_10004D9F8(self, (int)a2, a3, (uint64_t)&unk_1004D0C10);
}

- (void)resumePrecomputationsWithCompletionHandler:(id)a3
{
  sub_10004D9F8(self, (int)a2, a3, (uint64_t)&unk_1004D0BE8);
}

- (void)clearAllBindings
{
  _TtC3asd21PrecomputationManager *v2;

  v2 = self;
  PrecomputationManager.clearAllBindings()();

}

- (void)captureWithBindings:(id)a3
{
  Swift::OpaquePointer v4;
  _TtC3asd21PrecomputationManager *v5;

  v4._rawValue = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v5 = self;
  PrecomputationManager.capture(bindings:)(v4);
  swift_bridgeObjectRelease(v4._rawValue);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3asd21PrecomputationManager_state));
  v3 = (char *)self + OBJC_IVAR____TtC3asd21PrecomputationManager_logger;
  v4 = sub_1000357DC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_100032F94((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3asd21PrecomputationManager_analyticsManager));
  sub_100032F94((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3asd21PrecomputationManager_configurationManager));
}

@end

@implementation BridgedRegistrationContainer

- (id)registerProtocol:(id)a3 name:(id)a4 factory:(id)a5
{
  return sub_190AB6D34(self, (int)a2, a3, (uint64_t)a4, a5, (uint64_t)&unk_1E2CECAD8, (uint64_t)sub_190B74410, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))sub_190B7419C);
}

- (id)registerClass:(Class)a3 name:(id)a4 factory:(id)a5
{
  void *v7;
  _TtC13TeaFoundation28BridgedRegistrationContainer *v8;
  void *v9;
  void *v10;

  v7 = _Block_copy(a5);
  if (a4)
    sub_190BE5000();
  swift_getObjCClassMetadata();
  *(_QWORD *)(swift_allocObject() + 16) = v7;
  v8 = self;
  sub_190ABBED0();
  v10 = v9;

  swift_release();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)registerClass:(Class)a3 factory:(id)a4
{
  void *v5;
  _TtC13TeaFoundation28BridgedRegistrationContainer *v6;
  void *v7;
  void *v8;

  v5 = _Block_copy(a4);
  swift_getObjCClassMetadata();
  *(_QWORD *)(swift_allocObject() + 16) = v5;
  v6 = self;
  sub_190AF7898();
  v8 = v7;

  swift_release();
  return v8;
}

- (id)registerProtocol:(id)a3 factory:(id)a4
{
  return sub_190AF7920(self, (int)a2, a3, a4, (uint64_t)&unk_1E2CECB28, (uint64_t)sub_190B74410, (uint64_t (*)(id, uint64_t, uint64_t))sub_190B74110);
}

- (void).cxx_destruct
{
  swift_release();
}

- (id)registerUncheckedProtocol:(id)a3 factory:(id)a4
{
  return sub_190AF7920(self, (int)a2, a3, a4, (uint64_t)&unk_1E2CECA88, (uint64_t)sub_190B74410, (uint64_t (*)(id, uint64_t, uint64_t))sub_190B74234);
}

- (id)registerUncheckedProtocol:(id)a3 name:(id)a4 factory:(id)a5
{
  return sub_190AB6D34(self, (int)a2, a3, (uint64_t)a4, a5, (uint64_t)&unk_1E2CECA10, (uint64_t)sub_190AF7F98, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))sub_190B742DC);
}

- (_TtC13TeaFoundation28BridgedRegistrationContainer)init
{
  sub_190B74390();
}

@end

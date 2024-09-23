@implementation AEAPolicyActivationRunner

- (id)deactivationForScratchpad:(id)a3
{
  void *v5;

  swift_unknownObjectRetain(a3);
  swift_retain(self);
  v5 = (void *)sub_100036E64((uint64_t)a3);
  swift_unknownObjectRelease(a3);
  swift_release(self);
  return v5;
}

- (void)activateWithScratchpad:(id)a3 invalidationHandler:(id)a4 completion:(id)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = _Block_copy(a4);
  v9 = _Block_copy(a5);
  v10 = swift_allocObject(&unk_100085180, 24, 7);
  *(_QWORD *)(v10 + 16) = v8;
  v11 = swift_allocObject(&unk_1000851A8, 24, 7);
  *(_QWORD *)(v11 + 16) = v9;
  swift_unknownObjectRetain(a3);
  swift_retain(self);
  sub_100036F90((uint64_t)a3, (uint64_t)sub_100038018, v10, (uint64_t)sub_10001AC7C, v11);
  swift_unknownObjectRelease(a3);
  swift_release(self);
  swift_release(v10);
  swift_release(v11);
}

- (id)identifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v2 = a1[5];
  v3 = a1[6];
  sub_1000060F4(a1 + 2, v2);
  v4 = *(_QWORD *)(v3 + 8);
  v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  swift_retain(a1);
  v5(v2, v4);
  v7 = v6;
  swift_release(a1);
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  return v8;
}

- (uint64_t)event
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  uint64_t v6;

  v2 = a1[5];
  v3 = a1[6];
  sub_1000060F4(a1 + 2, v2);
  v4 = *(_QWORD *)(v3 + 8);
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 16);
  swift_retain(a1);
  v6 = v5(v2, v4);
  swift_release(a1);
  return v6;
}

@end

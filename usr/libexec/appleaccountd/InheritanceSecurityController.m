@implementation InheritanceSecurityController

- (void)createInheritanceAccessKeyForContact:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_10026F548, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  swift_unknownObjectRetain(a3);
  swift_retain(self);
  InheritanceSecurityController.createAccessKey(for:completion:)(a3, (uint64_t)sub_100088AB8, v7);
  swift_unknownObjectRelease(a3);
  swift_release(self);
  swift_release(v7);
}

- (void)removeInheritanceAccessKeyForBeneficiaryID:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = swift_allocObject(&unk_10026F520, 24, 7);
  *(_QWORD *)(v13 + 16) = v12;
  swift_retain(self);
  InheritanceSecurityController.removeAccessKey(for:completion:)((uint64_t)v11, (uint64_t)sub_1000891D0, v13);
  swift_release(self);
  swift_release(v13);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (void)preflightInheritanceRecoveryForBeneficiaryID:(id)a3 accessKey:(id)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  id v15;
  uint64_t v16;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v14);
  v15 = a4;
  swift_retain(self);
  sub_1001DF68C((uint64_t)v13, (uint64_t)v15, (uint64_t)self, (void (**)(_QWORD, _QWORD))v14);
  _Block_release(v14);
  _Block_release(v14);

  swift_release(self);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

- (void)checkInheritanceKeyForBeneficiaryID:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v12);
  swift_retain(self);
  sub_1001DFFAC((uint64_t)v11, (uint64_t)self, (void (**)(_QWORD, _QWORD))v12);
  _Block_release(v12);
  _Block_release(v12);
  swift_release(self);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

@end

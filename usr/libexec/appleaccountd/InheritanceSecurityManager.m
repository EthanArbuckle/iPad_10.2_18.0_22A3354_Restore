@implementation InheritanceSecurityManager

- (void)createInheritanceAccessKeyForContact:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  uint64_t v12;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_10026F660, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = *(void **)self->controller;
  v11[4] = sub_1001E0A3C;
  v12 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_100043E24;
  v11[3] = &unk_10026F678;
  v9 = _Block_copy(v11);
  v10 = v12;
  swift_unknownObjectRetain(a3);
  swift_retain(self);
  swift_retain(v7);
  swift_release(v10);
  objc_msgSend(v8, "createInheritanceAccessKeyForContact:completion:", a3, v9);
  _Block_release(v9);
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
  void *v14;
  Class isa;
  void *v16;
  uint64_t v17;
  _QWORD aBlock[5];
  uint64_t v19;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = swift_allocObject(&unk_10026F610, 24, 7);
  *(_QWORD *)(v13 + 16) = v12;
  v14 = *(void **)self->controller;
  swift_retain(self);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  aBlock[4] = sub_1000891D0;
  v19 = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001DC548;
  aBlock[3] = &unk_10026F628;
  v16 = _Block_copy(aBlock);
  v17 = v19;
  swift_retain(v13);
  swift_release(v17);
  objc_msgSend(v14, "removeInheritanceAccessKeyForBeneficiaryID:completion:", isa, v16);
  _Block_release(v16);
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
  uint64_t v15;
  void *v16;
  id v17;
  Class isa;
  void *v19;
  uint64_t v20;
  _QWORD aBlock[5];
  uint64_t v22;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  v13 = (char *)aBlock - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = swift_allocObject(&unk_10026F5C0, 24, 7);
  *(_QWORD *)(v15 + 16) = v14;
  v16 = *(void **)self->controller;
  v17 = a4;
  swift_retain(self);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  aBlock[4] = sub_1000891D0;
  v22 = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001DC548;
  aBlock[3] = &unk_10026F5D8;
  v19 = _Block_copy(aBlock);
  v20 = v22;
  swift_retain(v15);
  swift_release(v20);
  objc_msgSend(v16, "preflightInheritanceRecoveryForBeneficiaryID:accessKey:completion:", isa, v17, v19);
  _Block_release(v19);

  swift_release(self);
  swift_release(v15);

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
  void *v14;
  Class isa;
  void *v16;
  uint64_t v17;
  _QWORD aBlock[5];
  uint64_t v19;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = swift_allocObject(&unk_10026F570, 24, 7);
  *(_QWORD *)(v13 + 16) = v12;
  v14 = *(void **)self->controller;
  swift_retain(self);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  aBlock[4] = sub_1000891D0;
  v19 = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001DC548;
  aBlock[3] = &unk_10026F588;
  v16 = _Block_copy(aBlock);
  v17 = v19;
  swift_retain(v13);
  swift_release(v17);
  objc_msgSend(v14, "checkInheritanceKeyForBeneficiaryID:completion:", isa, v16);
  _Block_release(v16);
  swift_release(self);
  swift_release(v13);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

@end

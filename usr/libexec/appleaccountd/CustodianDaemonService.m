@implementation CustodianDaemonService

- (void)fetchTrustedContactsWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD v21[5];

  v5 = sub_1000080B4((uint64_t *)&unk_100294B20);
  __chkstk_darwin(v5, v6);
  v8 = (char *)&v21[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1000080B4((uint64_t *)&unk_10028E818);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  v13 = (char *)&v21[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a3);
  v15 = swift_allocObject(&unk_100263750, 24, 7);
  *(_QWORD *)(v15 + 16) = v14;
  (*(void (**)(char *, unsigned __int8 *, uint64_t))(v10 + 16))(v13, &self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC13appleaccountd22CustodianDaemonService__custodianFetcher], v9);
  swift_retain(self);
  Dependency.wrappedValue.getter(v21, v9);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  v16 = *sub_10000732C(v21, v21[3]);
  v17 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v8, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject(&unk_100263778, 56, 7);
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = v16;
  v18[5] = sub_100004034;
  v18[6] = v15;
  swift_retain(v16);
  swift_retain(v15);
  v19 = sub_10001CC6C((uint64_t)v8, (uint64_t)&unk_10028E880, (uint64_t)v18);
  swift_release(v19);
  sub_100006F58(v21);
  swift_release(self);
  swift_release(v15);
}

- (void)setupCustodianshipWithContext:(id)a3 completion:(id)a4
{
  sub_10007EFAC((uint64_t)self, (int)a2, a3, a4, (void (*)(id, uint64_t, void *))sub_10008436C);
}

- (void)reSendCustodianInvitationWithCustodianID:(id)a3 completion:(id)a4
{
  sub_100081874((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)&unk_100263930, (uint64_t)sub_1000891D0, (void (*)(char *, uint64_t, uint64_t))sub_100077DD4);
}

- (void)removeCustodian:(id)a3 completion:(id)a4
{
  sub_100079924((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(char *, uint64_t, void *))sub_100084E3C);
}

- (void)stopBeingCustodian:(id)a3 completion:(id)a4
{
  sub_100079924((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(char *, uint64_t, void *))sub_100085948);
}

- (void)fetchCachedTrustedContactsWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_1000080B4((uint64_t *)&unk_100294B20);
  __chkstk_darwin(v5, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject(&unk_1002637A0, 32, 7);
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = self;
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject(&unk_1002637C8, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10028E898;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject(&unk_1002637F0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10028E8A0;
  v13[5] = v12;
  swift_retain(self);
  v14 = sub_10015ACC8((uint64_t)v8, (uint64_t)&unk_10028E8A8, (uint64_t)v13);
  swift_release(v14);
}

- (void)fetchCustodianshipInfoWithCompletion:(id)a3
{
  sub_100082608((uint64_t)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_100085F40);
}

- (void)fetchCustodianshipInfoWithUUID:(id)a3 completion:(id)a4
{
  sub_100081874((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)&unk_1002636B0, (uint64_t)sub_100088B6C, (void (*)(char *, uint64_t, uint64_t))sub_10007A050);
}

- (void)fetchSuggestedCustodiansWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t (*)(uint64_t, char), uint64_t, uint64_t, uint64_t);

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_100263660, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(_QWORD *)&self->familyManager[24];
  v7 = *(_QWORD *)&self->familyManager[32];
  sub_10000732C(self->familyManager, v6);
  v8 = swift_allocObject(&unk_100263688, 32, 7);
  *(_QWORD *)(v8 + 16) = sub_100088B58;
  *(_QWORD *)(v8 + 24) = v5;
  v9 = *(void (**)(uint64_t (*)(uint64_t, char), uint64_t, uint64_t, uint64_t))(v7 + 16);
  swift_retain(self);
  swift_retain(v5);
  v9(sub_100088B60, v8, v6, v7);
  swift_release(self);
  swift_release(v5);
  swift_release(v8);
}

- (void)fetchCustodianHealthStatusWithCompletion:(id)a3
{
  sub_10007C80C((uint64_t)self, (int)a2, a3, (uint64_t)&unk_100263638, (uint64_t)sub_100088B50, (void (*)(uint64_t, uint64_t))sub_10007A9D8);
}

- (void)startCustodianRecoveryWithContext:(id)a3 completion:(id)a4
{
  sub_10007D38C((uint64_t)self, (int)a2, a3, a4, (uint64_t)&unk_100263610, (uint64_t)sub_100088B48, (void (*)(id, uint64_t, uint64_t))sub_10007AE6C);
}

- (BOOL)cancelCustodianRecoveryWithSessionID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  swift_retain(self);
  sub_10007BDBC(v5, v7);
  swift_bridgeObjectRelease(v7);
  swift_release(self);
  return 1;
}

- (void)fetchCustodianRecoveryConfigurationWithCompletion:(id)a3
{
  sub_10007C80C((uint64_t)self, (int)a2, a3, (uint64_t)&unk_1002635E8, (uint64_t)sub_1000891CC, (void (*)(uint64_t, uint64_t))sub_10007C030);
}

- (void)generateCustodianRecoveryCodeWithContext:(id)a3 completion:(id)a4
{
  sub_10007EFAC((uint64_t)self, (int)a2, a3, a4, sub_1000866A4);
}

- (void)validateCustodianRecoveryCodeWithContext:(id)a3 completion:(id)a4
{
  sub_10007D38C((uint64_t)self, (int)a2, a3, a4, (uint64_t)&unk_1002635C0, (uint64_t)sub_1000891CC, (void (*)(id, uint64_t, uint64_t))sub_10007CC8C);
}

- (void)fetchCustodianPasswordResetInformationWithSessionID:(id)a3 completion:(id)a4
{
  sub_10007E4E8((uint64_t)self, (int)a2, (uint64_t)a3, a4, (uint64_t)&unk_100263598, (uint64_t)sub_1000891CC, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10007D420);
}

- (void)fetchCustodianRecoveryKeysWithSessionID:(id)a3 completion:(id)a4
{
  sub_10007E4E8((uint64_t)self, (int)a2, (uint64_t)a3, a4, (uint64_t)&unk_100263570, (uint64_t)sub_1000891CC, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10007DC04);
}

- (void)respondToInviteWithContext:(id)a3 completion:(id)a4
{
  sub_10007EFAC((uint64_t)self, (int)a2, a3, a4, (void (*)(id, uint64_t, void *))sub_100086D0C);
}

- (void)startHealthCheckWithCompletion:(id)a3
{
  sub_100082608((uint64_t)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_100087150);
}

- (void)performTrustedContactsDataSyncWithCompletion:(id)a3
{
  sub_100082608((uint64_t)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_1000873DC);
}

- (void)startManateeMigrationWithCompletion:(id)a3
{
  sub_100082608((uint64_t)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_100087618);
}

- (void)pullTrustedContactsFromCloudKitWithCompletion:(id)a3
{
  sub_100082608((uint64_t)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_1000878A4);
}

- (void)displayTrustedContactFlowWithModel:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_100263408, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  swift_unknownObjectRetain(a3);
  swift_retain(self);
  sub_100080CA8((uint64_t)a3, (uint64_t)sub_1000891D0, v7);
  swift_unknownObjectRelease(a3);
  swift_release(self);
  swift_release(v7);
}

- (void)displayCustodianInviteWithUUID:(id)a3 completion:(id)a4
{
  sub_100081874((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)&unk_1002633E0, (uint64_t)sub_1000891D0, (void (*)(char *, uint64_t, uint64_t))sub_100080EB8);
}

- (void)availableRecoveryFactorsWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[5];

  v5 = sub_1000080B4(&qword_10028E858);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v14[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a3);
  v11 = swift_allocObject(&unk_100263390, 24, 7);
  *(_QWORD *)(v11 + 16) = v10;
  (*(void (**)(char *, unsigned __int8 *, uint64_t))(v6 + 16))(v9, &self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC13appleaccountd22CustodianDaemonService__recoveryFactorsController], v5);
  swift_retain(self);
  Dependency.wrappedValue.getter(v14, v5);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  sub_10000732C(v14, v14[3]);
  v12 = swift_allocObject(&unk_1002633B8, 32, 7);
  *(_QWORD *)(v12 + 16) = sub_100088AB8;
  *(_QWORD *)(v12 + 24) = v11;
  swift_retain(v11);
  sub_1000C3248((uint64_t)sub_100088AE4, v12);
  swift_release(v12);
  sub_100006F58(v14);
  swift_release(self);
  swift_release(v11);
}

- (void)repairCustodians:(id)a3 remove:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v8 = _Block_copy(a5);
  if (a3)
  {
    v9 = type metadata accessor for UUID(0);
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v9);
  }
  if (a4)
  {
    v10 = type metadata accessor for UUID(0);
    a4 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v10);
  }
  _Block_copy(v8);
  swift_retain(self);
  sub_100087C04((uint64_t)a3, (uint64_t)self, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);
  swift_release(self);
  swift_bridgeObjectRelease(a4);
  swift_bridgeObjectRelease(a3);
}

- (void)repairCustodians:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;

  v6 = _Block_copy(a4);
  if (a3)
  {
    v7 = type metadata accessor for UUID(0);
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  }
  _Block_copy(v6);
  swift_retain(self);
  sub_100087C04((uint64_t)a3, (uint64_t)self, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_release(self);
  swift_bridgeObjectRelease(a3);
}

- (void)preflightCustodianRecoveryWithCompletion:(id)a3
{
  sub_100082608((uint64_t)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_100088644);
}

@end

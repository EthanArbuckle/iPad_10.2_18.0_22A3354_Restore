@implementation CHInvitationDestinationCoordinator

- (CHInvitationDestinationCoordinator)init
{
  return (CHInvitationDestinationCoordinator *)sub_1004FACCC();
}

- (void)sendInvitationToDestinations:(id)a3 callerID:(id)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  CHWorkoutDetailHeartRateTableViewCell *v13;
  uint64_t v14;
  CHWorkoutDetailHeartRateTableViewCell *v15;
  CHWorkoutDetailHeartRateTableViewCell *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  CHInvitationDestinationCoordinator *v20;
  uint64_t v21;
  SEL v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  SEL v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;

  v9 = sub_100047110(&qword_10081E650);
  __chkstk_darwin(v9);
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (CHWorkoutDetailHeartRateTableViewCell *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v16 = v15;
  v17 = swift_allocObject(&unk_1007A55C8, 24, 7);
  *(_QWORD *)(v17 + 16) = v12;
  v18 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v11, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject(&unk_1007A55F0, 80, 7);
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = self;
  v19[5] = v13;
  v19[6] = v14;
  v19[7] = v16;
  v19[8] = sub_1004FC8A4;
  v19[9] = v17;
  v20 = self;
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRetain(v16);
  swift_retain(v17);
  v21 = sub_10020D9C0((uint64_t)v11, (uint64_t)&unk_1008383C8, (uint64_t)v19);

  swift_bridgeObjectRelease(v13, v22, v23, v24, v25, v26, v27, v28);
  swift_bridgeObjectRelease(v16, v29, v30, v31, v32, v33, v34, v35);
  swift_release(v17);
  swift_release(v21);
}

- (void)fetchReachableDestinationsFor:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  CHWorkoutDetailHeartRateTableViewCell *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  CHInvitationDestinationCoordinator *v16;
  uint64_t v17;
  SEL v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;

  v7 = sub_100047110(&qword_10081E650);
  __chkstk_darwin(v7);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (CHWorkoutDetailHeartRateTableViewCell *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  v12 = swift_allocObject(&unk_1007A5550, 24, 7);
  *(_QWORD *)(v12 + 16) = v10;
  v13 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v9, 1, 1, v13);
  v14 = swift_allocObject(&unk_1007A5578, 24, 7);
  swift_unknownObjectWeakInit(v14 + 16, self);
  v15 = (_QWORD *)swift_allocObject(&unk_1007A55A0, 64, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = v14;
  v15[5] = v11;
  v15[6] = sub_1004FC7B0;
  v15[7] = v12;
  v16 = self;
  swift_bridgeObjectRetain(v11);
  swift_retain(v12);
  v17 = sub_10020D9C0((uint64_t)v9, (uint64_t)&unk_10083D180, (uint64_t)v15);

  swift_bridgeObjectRelease(v11, v18, v19, v20, v21, v22, v23, v24);
  swift_release(v12);
  swift_release(v17);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (char *)self + OBJC_IVAR___CHInvitationDestinationCoordinator_invitationDestinationService;
  v4 = type metadata accessor for InvitationDestinationService(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___CHInvitationDestinationCoordinator_secureCloudClient;
  v7 = type metadata accessor for SecureCloudClient(0, v6);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v5, v7);
}

@end

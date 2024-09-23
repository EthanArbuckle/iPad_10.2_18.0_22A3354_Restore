@implementation _WBParticipantPresenceCoordinator

- (_WBParticipantPresenceCoordinator)init
{
  return (_WBParticipantPresenceCoordinator *)ParticipantPresenceCoordinator.init()();
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (void)moveCurrentParticipantToTabIdentifier:(id)a3 inTabGroupIdentifier:(id)a4 withDeviceIdentifier:(id)a5
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _WBParticipantPresenceCoordinator *v19;
  uint64_t v20;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    v10 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  a3 = v11;
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  a4 = v13;
LABEL_6:
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v16 = v15;
  v17 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v9, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = v10;
  v18[5] = a3;
  v18[6] = v12;
  v18[7] = a4;
  v18[8] = self;
  v18[9] = v14;
  v18[10] = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v19 = self;
  swift_bridgeObjectRetain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v9, (uint64_t)&closure #1 in ParticipantPresenceCoordinator.moveCurrentParticipant(toTab:inTabGroup:withDeviceIdentifier:)partial apply, (uint64_t)v18);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (void)getActiveParticipantsInTabWithIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  NSString *v14;
  _WBParticipantPresenceCoordinator *v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &async function pointer to partial apply for @objc closure #1 in ParticipantPresenceCoordinator.activeParticipantsInTab(_:);
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &_sIeghH_IeAgH_TRTATu;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v8, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v13);
  swift_release();
}

- (_WBParticipantPresenceCoordinatorDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____WBParticipantPresenceCoordinator_delegate;
  swift_beginAccess();
  return (_WBParticipantPresenceCoordinatorDelegate *)(id)MEMORY[0x24BD0FA24](v2);
}

- (void)getCurrentConnectionStateWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _WBParticipantPresenceCoordinator *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &async function pointer to partial apply for @objc closure #1 in ParticipantPresenceCoordinator.currentConnectionState();
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &_sIeghH_IeAgH_TRTA_149Tu;
  v12[5] = v11;
  v13 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v7, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_154Tu, (uint64_t)v12);
  swift_release();
}

- (void)beginDeviceCoordination
{
  _WBParticipantPresenceCoordinator *v2;

  v2 = self;
  ParticipantPresenceCoordinator.beginDeviceCoordination()();

}

- (void)endDeviceCoordination
{
  _WBParticipantPresenceCoordinator *v2;

  v2 = self;
  ParticipantPresenceCoordinator.endDeviceCoordination()();

}

- (void)beginCollaborationForShare:(id)a3
{
  @objc ParticipantPresenceCoordinator.beginCollaborationForShare(_:)(self, (uint64_t)a2, a3, (uint64_t)&unk_251BC9CA0, (uint64_t)&closure #1 in ParticipantPresenceCoordinator.beginCollaborationForShare(_:)partial apply);
}

- (void)shareDidUpdate:(id)a3
{
  _WBParticipantPresenceCoordinator *v4;
  id v5;

  v5 = a3;
  v4 = self;
  ParticipantPresenceCoordinator.shareDidUpdate(_:)((CKShare)v5);

}

- (void)endCollaborationForShare:(id)a3
{
  @objc ParticipantPresenceCoordinator.beginCollaborationForShare(_:)(self, (uint64_t)a2, a3, (uint64_t)&unk_251BC9C78, (uint64_t)&closure #1 in ParticipantPresenceCoordinator.endCollaborationForShare(_:)partial apply);
}

- (void)removeTabGroupWithIdentifier:(id)a3
{
  @objc ParticipantPresenceCoordinator.removeTabGroup(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_251BC9C28, (uint64_t)&closure #1 in ParticipantPresenceCoordinator.removeTabGroup(_:)partial apply);
}

- (void)removeTabWithIdentifier:(id)a3
{
  @objc ParticipantPresenceCoordinator.removeTabGroup(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_251BC9C00, (uint64_t)&closure #1 in ParticipantPresenceCoordinator.removeTab(_:)partial apply);
}

- (void)getTabGroupIdentifierForParticipantIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _WBParticipantPresenceCoordinator *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &async function pointer to partial apply for @objc closure #1 in ParticipantPresenceCoordinator.tabGroupIdentifierForParticipant(_:);
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &_sIeghH_IeAgH_TRTA_109Tu;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v9, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_114Tu, (uint64_t)v14);
  swift_release();
}

- (void)getTabIdentifierForParticipantIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _WBParticipantPresenceCoordinator *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &async function pointer to partial apply for @objc closure #1 in ParticipantPresenceCoordinator.tabIdentifierForParticipant(_:);
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &_sIeghH_IeAgH_TRTA_94Tu;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v9, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_99Tu, (uint64_t)v14);
  swift_release();
}

- (void)getCurrentLocationIdentifiersForParticipantIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _WBParticipantPresenceCoordinator *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &async function pointer to partial apply for @objc closure #1 in ParticipantPresenceCoordinator.currentLocationIdentifiersForParticipant(_:);
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &_sIeghH_IeAgH_TRTA_80Tu;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v9, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_85Tu, (uint64_t)v14);
  swift_release();
}

- (void)getActiveParticipantsInTabGroupWithIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _WBParticipantPresenceCoordinator *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &async function pointer to partial apply for @objc closure #1 in ParticipantPresenceCoordinator.activeParticipantsInTabGroup(_:);
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &_sIeghH_IeAgH_TRTA_66Tu;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v9, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_71Tu, (uint64_t)v14);
  swift_release();
}

- (void).cxx_destruct
{
  outlined destroy of weak ParticipantPresenceCoordinatorDelegate?((uint64_t)self + OBJC_IVAR____WBParticipantPresenceCoordinator_delegate);
  swift_release();
  swift_release();
}

@end

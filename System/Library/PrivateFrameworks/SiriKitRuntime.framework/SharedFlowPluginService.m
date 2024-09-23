@implementation SharedFlowPluginService

- (void)startTurnWithTurnData:(id)a3 bridge:(id)a4 reply:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  uint64_t v21;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  v14 = one-time initialization token for executor;
  v15 = a3;
  swift_unknownObjectRetain();
  swift_retain();
  if (v14 != -1)
    swift_once();
  v16 = type metadata accessor for Logger();
  __swift_project_value_buffer(v16, (uint64_t)static Logger.executor);
  Logger.debugF(file:function:)();
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = self;
  v17[3] = v15;
  v17[4] = a4;
  v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v11, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &closure #1 in SharedFlowPluginService.startTurn(turnData:bridge:reply:)partial apply;
  v19[5] = v17;
  v19[6] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSError?) -> ();
  v19[7] = v13;
  v20 = v15;
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v11, (uint64_t)&closure #1 in static AsyncTaskUtils.taskWithCatchingCompletion(completion:do:)partial apply, (uint64_t)v19);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();

}

- (void)loadFlowPluginWithBundleId:(id)a3 bundlePath:(id)a4 rcId:(id)a5 hypothesisId:(id)a6 reply:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a7);
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v16 = v15;
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v19 = v18;
  if (!a5)
  {
    v20 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v23 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v12, 1, 1, v23);
    goto LABEL_6;
  }
  v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  a5 = v21;
  if (!a6)
    goto LABEL_5;
LABEL_3:
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v22 = type metadata accessor for UUID();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v12, 0, 1, v22);
LABEL_6:
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = v13;
  swift_retain();
  SharedFlowPluginService.loadFlowPlugin(bundleId:bundlePath:rcId:hypothesisId:reply:)(v14, v16, v17, v19, v20, (uint64_t)a5, (uint64_t)v12, (uint64_t)_s14SiriKitRuntime27ConversationCanHandleResultCIeyBhy_ACIeghg_TRTA_0, v24);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)v12, (uint64_t *)&demangling cache variable for type metadata for UUID?);
}

- (void)endTurnWithReply:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v17;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = one-time initialization token for executor;
  swift_retain();
  if (v10 != -1)
    swift_once();
  v11 = type metadata accessor for Logger();
  __swift_project_value_buffer(v11, (uint64_t)static Logger.executor);
  Logger.debugF(file:function:)();
  v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v7, 1, 1, v12);
  v13 = one-time initialization token for shared;
  swift_retain();
  swift_retain();
  if (v13 != -1)
    swift_once();
  v14 = static ConversationActor.shared;
  v15 = lazy protocol witness table accessor for type ConversationActor and conformance ConversationActor();
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v14;
  v16[3] = v15;
  v16[4] = self;
  v16[5] = _sIeyBh_Iegh_TRTA_0;
  v16[6] = v9;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in SharedFlowPluginService.endTurn(reply:)partial apply, (uint64_t)v16);
  swift_release();
  swift_release();
  swift_release();
}

@end

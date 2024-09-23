@implementation ServiceBridgeDelegateXPCWrapper

- (void)fetchContextsFor:(id)a3 includesNearByDevices:(BOOL)a4 completion:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v11;
  v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v10, 1, 1, v14);
  v15 = one-time initialization token for shared;
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_retain();
  if (v15 != -1)
    swift_once();
  swift_beginAccess();
  v16 = static MessageBusActor.shared;
  v17 = lazy protocol witness table accessor for type MessageBusActor and conformance MessageBusActor();
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v16;
  *(_QWORD *)(v18 + 24) = v17;
  *(_QWORD *)(v18 + 32) = self;
  *(_QWORD *)(v18 + 40) = v12;
  *(_BYTE *)(v18 + 48) = a4;
  *(_QWORD *)(v18 + 56) = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSArray?) -> ();
  *(_QWORD *)(v18 + 64) = v13;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v10, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.fetchContexts(for:includesNearByDevices:completion:)partial apply, v18);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)submitWithExecutionOutput:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = one-time initialization token for shared;
  v14 = a3;
  swift_retain_n();
  v15 = v14;
  swift_retain();
  if (v13 != -1)
    swift_once();
  swift_beginAccess();
  v16 = static MessageBusActor.shared;
  v17 = lazy protocol witness table accessor for type MessageBusActor and conformance MessageBusActor();
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = v16;
  v18[3] = v17;
  v18[4] = self;
  v18[5] = v15;
  v18[6] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned SABaseCommand?, @unowned NSError?) -> ();
  v18[7] = v11;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v9, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.submit(executionOutput:completion:)partial apply, (uint64_t)v18);

  swift_release();
  swift_release();
  swift_release();
}

- (void)flowPluginWillExecuteWithFlowPluginInfo:(id)a3
{
  @objc ServiceBridgeDelegateXPCWrapper.close(withExecutionOutput:)((uint64_t)self, (uint64_t)a2, a3, (uint64_t)&unk_1E68516B8, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.flowPluginWillExecute(flowPluginInfo:)partial apply);
}

- (void)closeServerRequestForExecutionRequestId:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;
  v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v6, 1, 1, v10);
  v11 = one-time initialization token for shared;
  swift_retain_n();
  swift_bridgeObjectRetain();
  if (v11 != -1)
    swift_once();
  swift_beginAccess();
  v12 = static MessageBusActor.shared;
  v13 = lazy protocol witness table accessor for type MessageBusActor and conformance MessageBusActor();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = v12;
  v14[3] = v13;
  v14[4] = self;
  v14[5] = v7;
  v14[6] = v9;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v6, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.closeServerRequest(forExecutionRequestId:)partial apply, (uint64_t)v14);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)prepareForAudioHandoffWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = one-time initialization token for shared;
  swift_retain_n();
  swift_retain();
  if (v11 != -1)
    swift_once();
  swift_beginAccess();
  v12 = static MessageBusActor.shared;
  v13 = lazy protocol witness table accessor for type MessageBusActor and conformance MessageBusActor();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = v12;
  v14[3] = v13;
  v14[4] = self;
  v14[5] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ObjCBool) -> ();
  v14[6] = v9;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.prepareForAudioHandoff(completion:)partial apply, (uint64_t)v14);
  swift_release();
  swift_release();
  swift_release();
}

- (void)closeWithExecutionOutput:(id)a3
{
  @objc ServiceBridgeDelegateXPCWrapper.close(withExecutionOutput:)((uint64_t)self, (uint64_t)a2, a3, (uint64_t)&unk_1E6851730, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.close(withExecutionOutput:)partial apply);
}

- (void)closeWithExecutionOutput:(id)a3 errorString:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;
  v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v8, 1, 1, v12);
  v13 = one-time initialization token for shared;
  v14 = a3;
  swift_retain_n();
  v15 = v14;
  swift_bridgeObjectRetain();
  if (v13 != -1)
    swift_once();
  swift_beginAccess();
  v16 = static MessageBusActor.shared;
  v17 = lazy protocol witness table accessor for type MessageBusActor and conformance MessageBusActor();
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = v16;
  v18[3] = v17;
  v18[4] = self;
  v18[5] = v15;
  v18[6] = v9;
  v18[7] = v11;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v8, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.close(withExecutionOutput:errorString:)partial apply, (uint64_t)v18);

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)closeWithExecutionOutput:(id)a3 needsUserInput:(BOOL)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = one-time initialization token for shared;
  v12 = a3;
  swift_retain_n();
  v13 = v12;
  if (v11 != -1)
    swift_once();
  swift_beginAccess();
  v14 = static MessageBusActor.shared;
  v15 = lazy protocol witness table accessor for type MessageBusActor and conformance MessageBusActor();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v14;
  *(_QWORD *)(v16 + 24) = v15;
  *(_QWORD *)(v16 + 32) = self;
  *(_QWORD *)(v16 + 40) = v13;
  *(_BYTE *)(v16 + 48) = a4;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v9, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.close(withExecutionOutput:needsUserInput:)partial apply, v16);

  swift_release();
  swift_release();
}

- (void)fallbackToServerForResultCandidateId:(id)a3
{
  @objc ServiceBridgeDelegateXPCWrapper.fallbackToServer(forResultCandidateId:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_1E6851690, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.fallbackToServer(forResultCandidateId:)partial apply);
}

- (void)fallbackToInfoDomainResultsForResultCandidateId:(id)a3
{
  @objc ServiceBridgeDelegateXPCWrapper.fallbackToServer(forResultCandidateId:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_1E6851668, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.fallbackToInfoDomainResults(forResultCandidateId:)partial apply);
}

- (void)prepareForAudioHandoffFailedWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = one-time initialization token for shared;
  swift_retain_n();
  swift_retain();
  if (v11 != -1)
    swift_once();
  swift_beginAccess();
  v12 = static MessageBusActor.shared;
  v13 = lazy protocol witness table accessor for type MessageBusActor and conformance MessageBusActor();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = v12;
  v14[3] = v13;
  v14[4] = self;
  v14[5] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable () -> ();
  v14[6] = v9;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.prepareForAudioHandoffFailed(completion:)partial apply, (uint64_t)v14);
  swift_release();
  swift_release();
  swift_release();
}

- (void)fetchSpeechInfoWithReply:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = one-time initialization token for shared;
  swift_retain_n();
  swift_retain();
  if (v11 != -1)
    swift_once();
  swift_beginAccess();
  v12 = static MessageBusActor.shared;
  v13 = lazy protocol witness table accessor for type MessageBusActor and conformance MessageBusActor();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = v12;
  v14[3] = v13;
  v14[4] = self;
  v14[5] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ConversationCanHandleResult) -> ();
  v14[6] = v9;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.fetchSpeechInfo(reply:)partial apply, (uint64_t)v14);
  swift_release();
  swift_release();
  swift_release();
}

- (void)retriggerOriginalRequestWithExecutionRequestId:(id)a3 forUserId:(id)a4 givenCurrentExecutionRequestId:(id)a5 reply:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a6);
  v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v12;
  v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = v14;
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v18 = v17;
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v11;
  v20 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v10, 1, 1, v20);
  v21 = one-time initialization token for shared;
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  if (v21 != -1)
    swift_once();
  swift_beginAccess();
  v22 = static MessageBusActor.shared;
  v23 = lazy protocol witness table accessor for type MessageBusActor and conformance MessageBusActor();
  v24 = (_QWORD *)swift_allocObject();
  v24[2] = v22;
  v24[3] = v23;
  v25 = v29;
  v24[4] = self;
  v24[5] = v25;
  v26 = v28;
  v24[6] = v13;
  v24[7] = v26;
  v24[8] = v15;
  v24[9] = v16;
  v24[10] = v18;
  v24[11] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSError?) -> ();
  v24[12] = v19;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v10, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.retriggerOriginalRequest(withExecutionRequestId:forUserId:givenCurrentExecutionRequestId:reply:)partial apply, (uint64_t)v24);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)fetchRecentDialogsWithReply:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = one-time initialization token for shared;
  swift_retain_n();
  swift_retain();
  if (v11 != -1)
    swift_once();
  swift_beginAccess();
  v12 = static MessageBusActor.shared;
  v13 = lazy protocol witness table accessor for type MessageBusActor and conformance MessageBusActor();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = v12;
  v14[3] = v13;
  v14[4] = self;
  v14[5] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSArray) -> ();
  v14[6] = v9;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.fetchRecentDialogs(reply:)partial apply, (uint64_t)v14);
  swift_release();
  swift_release();
  swift_release();
}

- (void)submitExternalActivationRequestWithRequestInfo:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = one-time initialization token for shared;
  v14 = a3;
  swift_retain_n();
  v15 = v14;
  swift_retain();
  if (v13 != -1)
    swift_once();
  swift_beginAccess();
  v16 = static MessageBusActor.shared;
  v17 = lazy protocol witness table accessor for type MessageBusActor and conformance MessageBusActor();
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = v16;
  v18[3] = v17;
  v18[4] = self;
  v18[5] = v15;
  v18[6] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ObjCBool, @unowned NSError?) -> ();
  v18[7] = v11;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v9, (uint64_t)&closure #1 in ServiceBridgeDelegateXPCWrapper.submitExternalActivationRequest(withRequestInfo:completion:)partial apply, (uint64_t)v18);

  swift_release();
  swift_release();
  swift_release();
}

@end

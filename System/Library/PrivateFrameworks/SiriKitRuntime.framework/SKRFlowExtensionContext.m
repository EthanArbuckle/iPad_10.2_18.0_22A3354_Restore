@implementation SKRFlowExtensionContext

- (SKRFlowExtensionContext)init
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t ObjectType;
  uint64_t v6;
  SKRFlowExtensionContext *v7;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  ObjectType = swift_getObjectType();
  v6 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v4, 1, 1, v6);
  v7 = (SKRFlowExtensionContext *)(*(uint64_t (**)(_QWORD))(ObjectType + 216))(MEMORY[0x1E0DEE9D8]);
  swift_deallocPartialClassInstance();
  return v7;
}

- (SKRFlowExtensionContext)initWithInputItems:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t v8;
  SKRFlowExtensionContext *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  ObjectType = swift_getObjectType();
  v8 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (SKRFlowExtensionContext *)(*(uint64_t (**)(uint64_t, _QWORD, char *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(ObjectType + 216))(v6, 0, v5, 0, 0, 0, 0, 0, MEMORY[0x1E0DEE9D8]);
  swift_deallocPartialClassInstance();
  return v9;
}

- (SKRFlowExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjectType;
  uint64_t (*v17)(uint64_t, id, char *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v18;
  SKRFlowExtensionContext *v19;
  uint64_t v21;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  v8 = MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v21 - v11;
  v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    v14 = type metadata accessor for UUID();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v12, 0, 1, v14);
  }
  else
  {
    v15 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  }
  ObjectType = swift_getObjectType();
  outlined init with copy of UUID?((uint64_t)v12, (uint64_t)v10);
  v17 = *(uint64_t (**)(uint64_t, id, char *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(ObjectType + 216);
  v18 = a4;
  v19 = (SKRFlowExtensionContext *)v17(v13, a4, v10, 0, 0, 0, 0, 0, MEMORY[0x1E0DEE9D8]);
  outlined destroy of UUID?((uint64_t)v12);
  swift_deallocPartialClassInstance();
  return v19;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return @objc static FlowExtensionContext._extensionAuxiliaryVendorProtocol()((uint64_t)a1, (uint64_t)a2, &one-time initialization token for remoteConversationXPCInterface, (id *)&static RemoteConversationXPCHelper.remoteConversationXPCInterface);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return @objc static FlowExtensionContext._extensionAuxiliaryVendorProtocol()((uint64_t)a1, (uint64_t)a2, &one-time initialization token for remoteConversationHostXPCInterface, (id *)&static RemoteConversationXPCHelper.remoteConversationHostXPCInterface);
}

- (void)warmupWithRefId:(id)a3 reply:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SKRFlowExtensionContext *v10;

  v5 = _Block_copy(a4);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  FlowExtensionContext.warmup(refId:reply:)(v6, v8, (uint64_t)thunk for @escaping @callee_unowned @convention(block) @Sendable () -> ()partial apply, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)canHandleWithInputData:(id)a3 rcId:(id)a4 reply:(id)a5
{
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  SKRFlowExtensionContext *v18;

  v8 = _Block_copy(a5);
  v9 = a3;
  v10 = a4;
  v18 = self;
  v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v12;

  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v16 = v15;

  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v8;
  FlowExtensionContext.canHandle(inputData:rcId:reply:)(v11, v13, v14, v16, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ConversationCanHandleResult) -> (), v17);
  swift_bridgeObjectRelease();
  swift_release();
  outlined consume of Data._Representation(v11, v13);

}

- (void)cancelWithReply:(id)a3
{
  @objc FlowExtensionContext.cancel(reply:)(self, (int)a2, a3, (uint64_t)&unk_1E684A830, (uint64_t)thunk for @escaping @callee_unowned @convention(block) @Sendable () -> ()partial apply, (void (*)(uint64_t, uint64_t))FlowExtensionContext.cancel(reply:));
}

- (void)resetWithReply:(id)a3
{
  @objc FlowExtensionContext.cancel(reply:)(self, (int)a2, a3, (uint64_t)&unk_1E684A808, (uint64_t)thunk for @escaping @callee_unowned @convention(block) @Sendable () -> ()partial apply, (void (*)(uint64_t, uint64_t))FlowExtensionContext.reset(reply:));
}

- (void)ensureReadyWithReply:(id)a3
{
  @objc FlowExtensionContext.cancel(reply:)(self, (int)a2, a3, (uint64_t)&unk_1E684A7E0, (uint64_t)thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSError?) -> ()partial apply, (void (*)(uint64_t, uint64_t))FlowExtensionContext.ensureReady(reply:));
}

- (void)startTurnWithTurnData:(id)a3 bridge:(id)a4 reply:(id)a5
{
  void *v8;
  uint64_t v9;
  void (*v10)(void);
  id v11;
  SKRFlowExtensionContext *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.isa) + 0xE0);
  v11 = a3;
  swift_unknownObjectRetain();
  v12 = self;
  v10();
  RemoteConversationService.startTurn(turnData:bridge:reply:)(v11, (uint64_t)a4, (uint64_t)thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSError?) -> ()partial apply, v9);

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
}

- (void)startTurnFromCacheWithExecutionRequestId:(id)a3 bridge:(id)a4 reply:(id)a5
{
  _QWORD *v6;
  void (*v7)(_QWORD *, _QWORD, _QWORD);
  SKRFlowExtensionContext *v8;

  v6 = _Block_copy(a5);
  v7 = (void (*)(_QWORD *, _QWORD, _QWORD))v6[2];
  swift_unknownObjectRetain();
  v8 = self;
  v7(v6, 0, 0);
  _Block_release(v6);
  swift_unknownObjectRelease();

}

- (void)acceptInitialInputWithInputIdentifier:(id)a3 speechData:(id)a4 reply:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  void (*v14)(void);
  id v15;
  SKRFlowExtensionContext *v16;
  uint64_t v17;

  v8 = type metadata accessor for UUID();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  v14 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.isa) + 0xE0);
  v15 = a4;
  v16 = self;
  v14();
  RemoteConversationService.acceptInitialInput(inputIdentifier:speechData:reply:)((uint64_t)v11, v15, (uint64_t)thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned FlowExtensionUserInputResultXPC) -> ()partial apply, v13);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)acceptWithInputData:(id)a3 speechData:(id)a4 reply:(id)a5
{
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  SKRFlowExtensionContext *v15;

  v8 = _Block_copy(a5);
  v9 = a3;
  v10 = a4;
  v15 = self;
  v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v12;

  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v8;
  FlowExtensionContext.accept(inputData:speechData:reply:)(v11, v13, v10, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ConversationFlexibleExecutionSupportXPC) -> (), v14);
  swift_release();
  outlined consume of Data._Representation(v11, v13);

}

- (void)paraphraseWithReply:(id)a3
{
  @objc FlowExtensionContext.cancel(reply:)(self, (int)a2, a3, (uint64_t)&unk_1E684A740, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ConversationFlexibleExecutionSupportXPC) -> (), (void (*)(uint64_t, uint64_t))FlowExtensionContext.paraphrase(reply:));
}

- (void)prepareWithBridge:(id)a3 reply:(id)a4
{
  void *v5;
  uint64_t v6;
  SKRFlowExtensionContext *v7;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  swift_unknownObjectRetain();
  v7 = self;
  FlowExtensionContext.cancel(reply:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSError?) -> (), v6, (uint64_t)"prepare(bridge:reply:)", 22, (uint64_t)&unk_1E684A8D0, (uint64_t)&async function pointer to partial apply for closure #1 in RemoteConversationService.prepare(bridge:reply:));
  swift_unknownObjectRelease();

  swift_release();
}

- (void)commitWithBridge:(id)a3 reply:(id)a4
{
  void *v5;
  uint64_t v6;
  SKRFlowExtensionContext *v7;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  swift_unknownObjectRetain();
  v7 = self;
  FlowExtensionContext.cancel(reply:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ConversationFlexibleExecutionSupportXPC) -> (), v6, (uint64_t)"commit(bridge:reply:)", 21, (uint64_t)&unk_1E684A8A8, (uint64_t)&async function pointer to partial apply for closure #1 in RemoteConversationService.commit(bridge:reply:));
  swift_unknownObjectRelease();

  swift_release();
}

- (void)isEmptyWithReply:(id)a3
{
  @objc FlowExtensionContext.cancel(reply:)(self, (int)a2, a3, (uint64_t)&unk_1E684A6C8, (uint64_t)thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ObjCBool) -> ()partial apply, (void (*)(uint64_t, uint64_t))FlowExtensionContext.isEmpty(reply:));
}

- (void)isCorrectableWithReply:(id)a3
{
  @objc FlowExtensionContext.cancel(reply:)(self, (int)a2, a3, (uint64_t)&unk_1E684A6A0, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ObjCBool) -> (), (void (*)(uint64_t, uint64_t))FlowExtensionContext.isCorrectable(reply:));
}

- (void)flexibleExecutionSupportOptionsWithReply:(id)a3
{
  @objc FlowExtensionContext.cancel(reply:)(self, (int)a2, a3, (uint64_t)&unk_1E684A678, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ConversationFlexibleExecutionSupportXPC) -> (), (void (*)(uint64_t, uint64_t))FlowExtensionContext.flexibleExecutionSupportOptions(reply:));
}

- (void)drainAsyncWorkWithReply:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t (*v10)(void);
  SKRFlowExtensionContext *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.isa) + 0xE0);
  v11 = self;
  v12 = v10();
  v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v7, 1, 1, v13);
  v14 = one-time initialization token for shared;
  swift_retain();
  swift_retain();
  if (v14 != -1)
    swift_once();
  v15 = static ConversationActor.shared;
  v16 = lazy protocol witness table accessor for type PeerInfoProvider and conformance PeerInfoProvider((unint64_t *)&lazy protocol witness table cache variable for type ConversationActor and conformance ConversationActor, 255, (uint64_t (*)(uint64_t))type metadata accessor for ConversationActor, (uint64_t)&protocol conformance descriptor for ConversationActor);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = v15;
  v17[3] = v16;
  v17[4] = v12;
  v17[5] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable () -> ();
  v17[6] = v9;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in RemoteConversationService.drainAsyncWork(reply:)partial apply, (uint64_t)v17);

  swift_release();
  swift_release();
  swift_release();
}

- (SKRFlowExtensionContext)initWithInputItems:(id)a3 contextUUID:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  SKRFlowExtensionContext *result;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = type metadata accessor for UUID();
    v9 = 0;
  }
  else
  {
    v8 = type metadata accessor for UUID();
    v9 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, v9, 1);
  result = (SKRFlowExtensionContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end

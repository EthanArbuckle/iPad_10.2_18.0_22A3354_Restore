@implementation SendableRemoteConversationXPCWrapper

- (void)ensureReadyWithReply:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(void **)self->wrapped;
  v8[4] = thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSError?) -> ()partial apply;
  v8[5] = v5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Error?) -> ();
  v8[3] = &block_descriptor_119_1;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_ensureReadyWithReply_, v7);
  _Block_release(v7);
  swift_release();
  swift_release();
}

- (void)startTurnFromCacheWithExecutionRequestId:(id)a3 bridge:(id)a4 reply:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[6];

  v7 = _Block_copy(a5);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v7;
  v12 = *(void **)self->wrapped;
  swift_unknownObjectRetain();
  swift_retain();
  v13 = (void *)MEMORY[0x1B5E432E8](v8, v10);
  v15[4] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ObjCBool, @unowned NSError?) -> ();
  v15[5] = v11;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 1107296256;
  v15[2] = thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed Error?) -> ();
  v15[3] = &block_descriptor_105;
  v14 = _Block_copy(v15);
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_startTurnFromCacheWithExecutionRequestId_bridge_reply_, v13, a4, v14);
  _Block_release(v14);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

}

- (void)flexibleExecutionSupportOptionsWithReply:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(void **)self->wrapped;
  v8[4] = _s14SiriKitRuntime39ConversationFlexibleExecutionSupportXPCCIeyBhy_ACIeghg_TRTA_0;
  v8[5] = v5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed ConversationCanHandleResult) -> ();
  v8[3] = &block_descriptor_49;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_flexibleExecutionSupportOptionsWithReply_, v7);
  _Block_release(v7);
  swift_release();
  swift_release();
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
  void *v15;
  Class isa;
  void *v17;
  _QWORD v18[6];

  v8 = _Block_copy(a5);
  v9 = a3;
  v10 = a4;
  swift_retain();
  v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v12;

  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v8;
  v15 = *(void **)self->wrapped;
  isa = Data._bridgeToObjectiveC()().super.isa;
  v18[4] = _s14SiriKitRuntime39ConversationFlexibleExecutionSupportXPCCIeyBhy_ACIeghg_TRTA_0;
  v18[5] = v14;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 1107296256;
  v18[2] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed ConversationCanHandleResult) -> ();
  v18[3] = &block_descriptor_99;
  v17 = _Block_copy(v18);
  swift_retain();
  swift_release();
  objc_msgSend(v15, sel_acceptWithInputData_speechData_reply_, isa, v10, v17);
  _Block_release(v17);
  swift_release();

  outlined consume of Data._Representation(v11, v13);
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
  void *v18;
  Class isa;
  void *v20;
  void *v21;
  _QWORD v22[6];

  v8 = _Block_copy(a5);
  v9 = a3;
  v10 = a4;
  swift_retain();
  v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v12;

  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v16 = v15;

  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v8;
  v18 = *(void **)self->wrapped;
  isa = Data._bridgeToObjectiveC()().super.isa;
  v20 = (void *)MEMORY[0x1B5E432E8](v14, v16);
  v22[4] = _s14SiriKitRuntime27ConversationCanHandleResultCIeyBhy_ACIeghg_TRTA_0;
  v22[5] = v17;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 1107296256;
  v22[2] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed ConversationCanHandleResult) -> ();
  v22[3] = &block_descriptor_139;
  v21 = _Block_copy(v22);
  swift_retain();
  swift_release();
  objc_msgSend(v18, sel_canHandleWithInputData_rcId_reply_, isa, v20, v21);
  _Block_release(v21);
  swift_bridgeObjectRelease();
  swift_release();

  outlined consume of Data._Representation(v11, v13);
  swift_release();
}

- (void)acceptInitialInputWithInputIdentifier:(id)a3 speechData:(id)a4 reply:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  Class isa;
  void *v17;
  _QWORD aBlock[6];

  v8 = type metadata accessor for UUID();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  v14 = *(void **)self->wrapped;
  v15 = a4;
  swift_retain();
  isa = UUID._bridgeToObjectiveC()().super.isa;
  aBlock[4] = _s14SiriKitRuntime39ConversationFlexibleExecutionSupportXPCCIeyBhy_ACIeghg_TRTA_0;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed ConversationCanHandleResult) -> ();
  aBlock[3] = &block_descriptor_92;
  v17 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v14, sel_acceptInitialInputWithInputIdentifier_speechData_reply_, isa, v15, v17);
  _Block_release(v17);

  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)prepareWithBridge:(id)a3 reply:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[6];

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = *(void **)self->wrapped;
  v10[4] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSError?) -> ();
  v10[5] = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1107296256;
  v10[2] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Error?) -> ();
  v10[3] = &block_descriptor_86;
  v9 = _Block_copy(v10);
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_prepareWithBridge_reply_, a3, v9);
  _Block_release(v9);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
}

- (void)commitWithBridge:(id)a3 reply:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[6];

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = *(void **)self->wrapped;
  v10[4] = _s14SiriKitRuntime39ConversationFlexibleExecutionSupportXPCCIeyBhy_ACIeghg_TRTA_0;
  v10[5] = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1107296256;
  v10[2] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed ConversationCanHandleResult) -> ();
  v10[3] = &block_descriptor_74;
  v9 = _Block_copy(v10);
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_commitWithBridge_reply_, a3, v9);
  _Block_release(v9);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
}

- (void)isEmptyWithReply:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(void **)self->wrapped;
  v8[4] = thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ObjCBool) -> ()partial apply;
  v8[5] = v5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = thunk for @escaping @callee_guaranteed @Sendable (@unowned Bool) -> ();
  v8[3] = &block_descriptor_62;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_isEmptyWithReply_, v7);
  _Block_release(v7);
  swift_release();
  swift_release();
}

- (void)isCorrectableWithReply:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(void **)self->wrapped;
  v8[4] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned ObjCBool) -> ();
  v8[5] = v5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = thunk for @escaping @callee_guaranteed @Sendable (@unowned Bool) -> ();
  v8[3] = &block_descriptor_55;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_isCorrectableWithReply_, v7);
  _Block_release(v7);
  swift_release();
  swift_release();
}

- (void)cancelWithReply:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(void **)self->wrapped;
  v8[4] = thunk for @escaping @callee_unowned @convention(block) @Sendable () -> ()partial apply;
  v8[5] = v5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  v8[3] = &block_descriptor_133;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_cancelWithReply_, v7);
  _Block_release(v7);
  swift_release();
  swift_release();
}

- (void)warmupWithRefId:(id)a3 reply:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];

  v5 = _Block_copy(a4);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = *(void **)self->wrapped;
  swift_retain();
  v11 = (void *)MEMORY[0x1B5E432E8](v6, v8);
  v13[4] = thunk for @escaping @callee_unowned @convention(block) @Sendable () -> ()partial apply;
  v13[5] = v9;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 1107296256;
  v13[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  v13[3] = &block_descriptor_146;
  v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_warmupWithRefId_reply_, v11, v12);
  _Block_release(v12);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

}

- (void)resetWithReply:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(void **)self->wrapped;
  v8[4] = thunk for @escaping @callee_unowned @convention(block) @Sendable () -> ()partial apply;
  v8[5] = v5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  v8[3] = &block_descriptor_126;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_resetWithReply_, v7);
  _Block_release(v7);
  swift_release();
  swift_release();
}

- (void)startTurnWithTurnData:(id)a3 bridge:(id)a4 reply:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[6];

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = *(void **)self->wrapped;
  v13[4] = thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSError?) -> ()partial apply;
  v13[5] = v9;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 1107296256;
  v13[2] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Error?) -> ();
  v13[3] = &block_descriptor_112;
  v11 = _Block_copy(v13);
  v12 = a3;
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_startTurnWithTurnData_bridge_reply_, v12, a4, v11);
  _Block_release(v11);

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
}

- (void)paraphraseWithReply:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(void **)self->wrapped;
  v8[4] = _s14SiriKitRuntime39ConversationFlexibleExecutionSupportXPCCIeyBhy_ACIeghg_TRTA_0;
  v8[5] = v5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed ConversationCanHandleResult) -> ();
  v8[3] = &block_descriptor_80;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_paraphraseWithReply_, v7);
  _Block_release(v7);
  swift_release();
  swift_release();
}

- (void)drainAsyncWorkWithReply:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(void **)self->wrapped;
  v8[4] = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable () -> ();
  v8[5] = v5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  v8[3] = &block_descriptor_68_0;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_drainAsyncWorkWithReply_, v7);
  _Block_release(v7);
  swift_release();
  swift_release();
}

@end

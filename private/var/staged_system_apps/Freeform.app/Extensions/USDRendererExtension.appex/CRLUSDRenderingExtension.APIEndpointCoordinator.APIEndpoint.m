@implementation CRLUSDRenderingExtension.APIEndpointCoordinator.APIEndpoint

- (void)getExtensionProcessIDWithResponse:(id)a3
{
  void (**v4)(void *, id);
  void *v5;
  id v6;
  id v7;

  v4 = (void (**)(void *, id))_Block_copy(a3);
  v5 = (void *)objc_opt_self(NSProcessInfo);
  swift_retain(self);
  v6 = objc_msgSend(v5, "processInfo");
  v7 = objc_msgSend(v6, "processIdentifier");

  v4[2](v4, v7);
  _Block_release(v4);
  swift_release(self);
}

- (void)makeCoreRERendererProxyForUUID:(id)a3 delegateProxy:(id)a4 flags:(unint64_t)a5 response:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;

  v11 = sub_1000131C0(&qword_1000836D0);
  __chkstk_darwin(v11);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v17 = v16;
  v18 = swift_allocObject(&unk_1000751B0, 24, 7);
  *(_QWORD *)(v18 + 16) = v14;
  v19 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v13, 1, 1, v19);
  type metadata accessor for MainActor(0);
  swift_unknownObjectRetain_n(a4, 2);
  swift_retain_n(self, 2);
  swift_bridgeObjectRetain(v17);
  v20 = swift_retain(v18);
  v21 = static MainActor.shared.getter(v20);
  v22 = (_QWORD *)swift_allocObject(&unk_1000751D8, 88, 7);
  v22[2] = v21;
  v22[3] = &protocol witness table for MainActor;
  v22[4] = self;
  v22[5] = v15;
  v22[6] = v17;
  v22[7] = a4;
  v22[8] = a5;
  v22[9] = sub_10004C978;
  v22[10] = v18;
  v23 = sub_10002E594((uint64_t)v13, (uint64_t)&unk_1000857D8, (uint64_t)v22);
  swift_release(v23);
  swift_release(v18);
  swift_bridgeObjectRelease(v17);
  swift_release(self);
  swift_unknownObjectRelease(a4);
}

- (void)didTeardownCoreRERendererForUUID:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = sub_1000131C0(&qword_1000836D0);
  __chkstk_darwin(v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v7, 1, 1, v11);
  v12 = swift_allocObject(&unk_100075160, 24, 7);
  swift_weakInit(v12 + 16, self);
  type metadata accessor for MainActor(0);
  swift_retain(self);
  swift_retain(v12);
  v13 = swift_bridgeObjectRetain(v10);
  v14 = static MainActor.shared.getter(v13);
  v15 = (_QWORD *)swift_allocObject(&unk_100075188, 56, 7);
  v15[2] = v14;
  v15[3] = &protocol witness table for MainActor;
  v15[4] = v12;
  v15[5] = v8;
  v15[6] = v10;
  swift_release(v12);
  v16 = sub_10002E6E0((uint64_t)v7, (uint64_t)&unk_1000857C8, (uint64_t)v15);
  swift_release(v16);
  swift_bridgeObjectRelease(v10);
  swift_release(self);
}

@end

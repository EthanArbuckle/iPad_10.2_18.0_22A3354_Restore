@implementation SDShareSheetAirDropController

- (NSString)sessionID
{
  return (NSString *)sub_1004BB754((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SDShareSheetAirDropController_sessionID);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR___SDShareSheetAirDropController_queue));
}

- (SDXPCHelperConnection)helperConnection
{
  return (SDXPCHelperConnection *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___SDShareSheetAirDropController_helperConnection, a2);
}

- (void)setHelperConnection:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___SDShareSheetAirDropController_helperConnection, a3);
}

- (SDShareSheetAirDropControllerDelegate)delegate
{
  return (SDShareSheetAirDropControllerDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___SDShareSheetAirDropController_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___SDShareSheetAirDropController_delegate, a3);
}

- (id)transferUpdateChangedHandler
{
  return sub_1004B4804((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SDShareSheetAirDropController_transferUpdateChangedHandler, (uint64_t)sub_1002377A0, (uint64_t)&unk_10072BA90);
}

- (void)setTransferUpdateChangedHandler:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v6)();
  uint64_t (**v7)();
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_10072BA78, 24, 7);
    v4[2] = v5;
    v6 = sub_1003805C8;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR___SDShareSheetAirDropController_transferUpdateChangedHandler);
  v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropController_transferUpdateChangedHandler);
  v8 = *(_QWORD *)&self->browser[OBJC_IVAR___SDShareSheetAirDropController_transferUpdateChangedHandler];
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_1002845F4(v9, v8);
}

- (id)availableNodesChangedHandler
{
  return sub_1004B4804((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SDShareSheetAirDropController_availableNodesChangedHandler, (uint64_t)sub_1004B488C, (uint64_t)&unk_10072BA40);
}

- (void)setAvailableNodesChangedHandler:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void (*v6)(uint64_t);
  void (**v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_10072BA28, 24, 7);
    v4[2] = v5;
    v6 = sub_1004BD384;
  }
  else
  {
    v6 = 0;
  }
  v7 = (void (**)(uint64_t))((char *)self
                                     + OBJC_IVAR___SDShareSheetAirDropController_availableNodesChangedHandler);
  v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropController_availableNodesChangedHandler);
  v8 = *(_QWORD *)&self->browser[OBJC_IVAR___SDShareSheetAirDropController_availableNodesChangedHandler];
  *v7 = v6;
  v7[1] = (void (*)(uint64_t))v4;
  sub_1002845F4(v9, v8);
}

- (NSArray)availableNodes
{
  const char *v2;
  Class isa;

  v2 = *(const char **)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropController_availableNodes);
  swift_bridgeObjectRetain(v2, a2);
  sub_100008384(&qword_1007C3470);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (void)setAvailableNodes:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  const char *v7;

  v5 = sub_100008384(&qword_1007C3470);
  v6 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = *(const char **)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropController_availableNodes);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropController_availableNodes) = v6;
  swift_bridgeObjectRelease(v7);
}

- (BOOL)hasActiveNearbySharingInteraction
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  _BYTE v10[24];

  v3 = sub_100008384((uint64_t *)&unk_1007B6220);
  __chkstk_darwin(v3);
  v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = (char *)self + OBJC_IVAR___SDShareSheetAirDropController_currentNearbySharingInteraction;
  swift_beginAccess(v6, v10, 0, 0);
  sub_100221F28((uint64_t)v6, (uint64_t)v5, (uint64_t *)&unk_1007B6220);
  v7 = type metadata accessor for SFAirDrop.NearbySharingInteraction(0);
  LOBYTE(v6) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7) != 1;
  sub_10000D0F0((uint64_t)v5, (uint64_t *)&unk_1007B6220);
  return (char)v6;
}

- (SDShareSheetAirDropController)initWithSessionID:(id)a3 queue:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (SDShareSheetAirDropController *)sub_1004B4B20(v5, v6, a4);
}

- (void)activateWithBundleID:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  SDShareSheetAirDropController *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = sub_100008384(&qword_1007B68A0);
  __chkstk_darwin(v5);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v7, 1, 1, v11);
  v12 = qword_1007B3D98;
  v13 = self;
  swift_bridgeObjectRetain(v10);
  if (v12 != -1)
    swift_once(&qword_1007B3D98, sub_1002ACAEC);
  v14 = static AirDropActor.shared;
  v15 = sub_100220D78((unint64_t *)&qword_1007BCF00, (uint64_t (*)(uint64_t))type metadata accessor for AirDropActor, (uint64_t)&protocol conformance descriptor for AirDropActor);
  v16 = (_QWORD *)swift_allocObject(&unk_10072B9D8, 56, 7);
  v16[2] = v14;
  v16[3] = v15;
  v16[4] = v13;
  v16[5] = v8;
  v16[6] = v10;
  swift_retain();
  v17 = sub_100252EC0((uint64_t)v7, (uint64_t)&unk_1007C3458, (uint64_t)v16);
  swift_release(v17);
  swift_bridgeObjectRelease(v10);

}

- (void)invalidate
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  SDShareSheetAirDropController *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = sub_100008384(&qword_1007B68A0);
  __chkstk_darwin(v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = qword_1007B3D98;
  v8 = self;
  if (v7 != -1)
    swift_once(&qword_1007B3D98, sub_1002ACAEC);
  v9 = static AirDropActor.shared;
  v10 = sub_100220D78((unint64_t *)&qword_1007BCF00, (uint64_t (*)(uint64_t))type metadata accessor for AirDropActor, (uint64_t)&protocol conformance descriptor for AirDropActor);
  v11 = (_QWORD *)swift_allocObject(&unk_10072B988, 40, 7);
  v11[2] = v9;
  v11[3] = v10;
  v11[4] = v8;
  swift_retain();
  v12 = sub_100252EC0((uint64_t)v5, (uint64_t)&unk_1007C3440, (uint64_t)v11);
  swift_release(v12);

}

- (void)send:(id)a3 to:(id)a4 itemPreviewData:(id)a5 requestSource:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  id v21;
  SDShareSheetAirDropController *v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  const char *v26;
  id v27;
  SDShareSheetAirDropController *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  SDShareSheetAirDropController *v38;
  const char *v39;
  uint64_t *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t *v43;
  const char *v44;
  SDShareSheetAirDropController *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  const char *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  SDShareSheetAirDropController *v54;

  v11 = sub_100008384(&qword_1007B68A0);
  __chkstk_darwin(v11);
  v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for UUID(0);
  v52 = *(_QWORD *)(v14 - 8);
  v15 = *(_QWORD *)(v52 + 64);
  v16 = __chkstk_darwin(v14);
  v17 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v19 = (char *)&v47 - v18;
  v20 = type metadata accessor for URL(0);
  v53 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v20);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v54 = self;
  if (!a5)
  {
    v27 = a6;
    v28 = self;
    v50 = 0xF000000000000000;
    v51 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v47 = 0;
    v49 = 0;
    goto LABEL_6;
  }
  v21 = a6;
  v22 = self;
  v23 = a5;
  v24 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v50 = v25;
  v51 = v24;

  if (!a6)
    goto LABEL_5;
LABEL_3:
  v47 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v49 = v26;

LABEL_6:
  v29 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v13, 1, 1, v29);
  v30 = v52;
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v17, v19, v14);
  v31 = *(unsigned __int8 *)(v30 + 80);
  v32 = (v31 + 40) & ~v31;
  v33 = (v15 + v32 + 7) & 0xFFFFFFFFFFFFFFF8;
  v34 = (v33 + 15) & 0xFFFFFFFFFFFFFFF8;
  v48 = v19;
  v35 = v14;
  v36 = (v34 + 23) & 0xFFFFFFFFFFFFFFF8;
  v37 = (char *)swift_allocObject(&unk_10072B938, v36 + 16, v31 | 7);
  *((_QWORD *)v37 + 2) = 0;
  *((_QWORD *)v37 + 3) = 0;
  v38 = v54;
  *((_QWORD *)v37 + 4) = v54;
  (*(void (**)(char *, char *, uint64_t))(v30 + 32))(&v37[v32], v17, v35);
  v39 = (const char *)v53;
  *(_QWORD *)&v37[v33] = v53;
  v40 = (uint64_t *)&v37[v34];
  v42 = v50;
  v41 = v51;
  *v40 = v51;
  v40[1] = v42;
  v43 = (uint64_t *)&v37[v36];
  v44 = v49;
  *v43 = v47;
  v43[1] = (uint64_t)v44;
  v45 = v38;
  swift_bridgeObjectRetain(v39);
  sub_100244404(v41, v42);
  swift_bridgeObjectRetain(v44);
  v46 = sub_100252EC0((uint64_t)v13, (uint64_t)&unk_1007C33B0, (uint64_t)v37);
  swift_release(v46);
  swift_bridgeObjectRelease(v44);
  sub_100225AA0(v41, v42);
  swift_bridgeObjectRelease(v39);

  (*(void (**)(char *, uint64_t))(v30 + 8))(v48, v35);
}

- (void)cancelCurrentSend
{
  SDShareSheetAirDropController *v2;

  v2 = self;
  sub_1004B870C();

}

- (SDShareSheetAirDropController)init
{
  SDShareSheetAirDropController *result;

  result = (SDShareSheetAirDropController *)_swift_stdlib_reportUnimplementedInitializer("DaemoniOSLibrary.ShareSheetAirDropController", 44, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropController_browser));
  swift_bridgeObjectRelease(*(const char **)&self->browser[OBJC_IVAR___SDShareSheetAirDropController_realName]);
  sub_10000D0F0((uint64_t)self + OBJC_IVAR___SDShareSheetAirDropController_currentTransferID, (uint64_t *)&unk_1007B7E50);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropController_airDropClient));
  swift_bridgeObjectRelease(*(const char **)&self->browser[OBJC_IVAR___SDShareSheetAirDropController_sessionID]);

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___SDShareSheetAirDropController_helperConnection);
  sub_100232F78((uint64_t)self + OBJC_IVAR___SDShareSheetAirDropController_delegate);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropController_lockStateMonitor));
  sub_1002845F4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropController_transferUpdateChangedHandler), *(_QWORD *)&self->browser[OBJC_IVAR___SDShareSheetAirDropController_transferUpdateChangedHandler]);
  sub_1002845F4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropController_availableNodesChangedHandler), *(_QWORD *)&self->browser[OBJC_IVAR___SDShareSheetAirDropController_availableNodesChangedHandler]);
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                           + OBJC_IVAR___SDShareSheetAirDropController_availableNodes));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___SDShareSheetAirDropController_updateNearbySharingInteractionsTask));
  sub_10000D0F0((uint64_t)self + OBJC_IVAR___SDShareSheetAirDropController_currentNearbySharingInteraction, (uint64_t *)&unk_1007B6220);
}

@end

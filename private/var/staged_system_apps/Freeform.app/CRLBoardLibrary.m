@implementation CRLBoardLibrary

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC8Freeform15CRLBoardLibrary *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = self;
  sub_100CAD7CC();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[CRLBoardLibrary dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform15CRLBoardLibrary_entityStore));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform15CRLBoardLibrary_boardShareController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform15CRLBoardLibrary_userDataDeletionRequestObserver));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Freeform15CRLBoardLibrary_databaseSyncObserver));
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform15CRLBoardLibrary_networkReachabilityListener, &qword_1013E6100);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform15CRLBoardLibrary_realTimeCollaborationDelegate);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Freeform15CRLBoardLibrary_opportunisticGroupSessionManager));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform15CRLBoardLibrary_syncPriorityProvider));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (_TtC8Freeform15CRLBoardLibrary)init
{
  _TtC8Freeform15CRLBoardLibrary *result;

  result = (_TtC8Freeform15CRLBoardLibrary *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLBoardLibrary", 24, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)highlightControllerHighlightsDidChange:(id)a3 highlights:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8Freeform15CRLBoardLibrary *v10;

  v7 = type metadata accessor for CRLSharedHighlight(0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_100CEBE94(v8);

  swift_bridgeObjectRelease();
}

- (void)updateBoardMetadataForNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8Freeform15CRLBoardLibrary *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100CD4934((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)updateStoreSnapshotForHierarchyNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  _TtC8Freeform15CRLBoardLibrary *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  __n128 v23;
  uint64_t v24;

  v5 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Notification(0, v8);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  __chkstk_darwin(v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v15 = (char *)&v24 - v14;
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v16 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v7, 1, 1, v16);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v12, v15, v9);
  type metadata accessor for MainActor(0);
  v17 = self;
  v18 = static MainActor.shared.getter(v17);
  v19 = *(unsigned __int8 *)(v10 + 80);
  v20 = (v19 + 40) & ~v19;
  v21 = (char *)swift_allocObject(&unk_10129F700, v20 + v11, v19 | 7);
  *((_QWORD *)v21 + 2) = v18;
  *((_QWORD *)v21 + 3) = &protocol witness table for MainActor;
  *((_QWORD *)v21 + 4) = v17;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v21[v20], v12, v9);
  v22 = sub_100521B98((uint64_t)v7, (uint64_t)&unk_10140E010, (uint64_t)v21);

  v23 = swift_release(v22);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v15, v9, v23);
}

@end

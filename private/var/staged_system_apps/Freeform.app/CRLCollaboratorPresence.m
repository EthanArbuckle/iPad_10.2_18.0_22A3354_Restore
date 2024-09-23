@implementation CRLCollaboratorPresence

- (NSUUID)presenceUUID
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (NSDate)joinTime
{
  return (NSDate *)Date._bridgeToObjectiveC()().super.isa;
}

- (NSDate)lastCursorUpdateTime
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  Class isa;
  _BYTE v11[24];

  v3 = type metadata accessor for Date(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = (char *)self + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_lastCursorUpdateTime;
  swift_beginAccess(v7, v11, 0, 0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)isa;
}

- (void)setLastCursorUpdateTime:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  void (*v10)(char *, _BYTE *, uint64_t);
  _TtC8Freeform23CRLCollaboratorPresence *v11;
  _BYTE v13[24];

  v5 = type metadata accessor for Date(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = (char *)self + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_lastCursorUpdateTime;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_lastCursorUpdateTime, v13, 33, 0);
  v10 = *(void (**)(char *, _BYTE *, uint64_t))(v6 + 40);
  v11 = self;
  v10(v9, v8, v5);
  swift_endAccess(v13);

}

- (_TtC8Freeform27CRLCollaborationParticipant)owner
{
  return (_TtC8Freeform27CRLCollaborationParticipant *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_owner);
}

- (void)setOwner:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_owner, a3);
}

- (NSString)displayName
{
  return (NSString *)sub_10057F078((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_displayName);
}

- (NSString)shortDisplayName
{
  return (NSString *)sub_10057F078((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_shortDisplayName);
}

- (_TtC8Freeform23CRLCollaboratorPresence)initWithOwner:(id)a3 presenceUUID:(id)a4 joinTime:(id)a5 isLocal:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  _TtC8Freeform23CRLCollaboratorPresence *v17;
  uint64_t v19;

  v6 = a6;
  v10 = type metadata accessor for Date(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for UUID(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = (_TtC8Freeform23CRLCollaboratorPresence *)sub_10057F7D8((uint64_t)v16, (uint64_t)v15, (uint64_t)v12, v6);

  return v17;
}

- (NSString)description
{
  _TtC8Freeform23CRLCollaboratorPresence *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10057F204();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  _TtC8Freeform23CRLCollaboratorPresence *v5;
  uint64_t v6;
  _TtC8Freeform23CRLCollaboratorPresence *v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_10057F340((uint64_t)v10);

  sub_1004CB800((uint64_t)v10, &qword_1013E0230);
  return v8 & 1;
}

- (int64_t)hash
{
  _TtC8Freeform23CRLCollaboratorPresence *v2;
  int64_t v3;

  v2 = self;
  v3 = UUID.hashValue.getter();

  return v3;
}

- (BOOL)isLocal
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_isLocalParticipant);
}

- (int64_t)collaboratorColorIndex
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_collaboratorColorIndex);
}

- (void)setCollaboratorColorIndex:(int64_t)a3
{
  uint64_t v3;
  _TtC8Freeform23CRLCollaboratorPresence *v5;
  id Strong;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_collaboratorColorIndex);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_collaboratorColorIndex) = (Class)a3;
  if (v3 != a3)
  {
    Strong = (id)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_owner);
    v5 = self;
    objc_msgSend(Strong, "updateCachedCollaboratorColors");

  }
}

- (id)collaboratorColorForType:(int64_t)a3
{
  return sub_100766FC4(a3, *(unint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_collaboratorColorIndex));
}

- (id)collaboratorColorName
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  sub_100767264(*(unint64_t *)((char *)&self->super.isa
                                    + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_collaboratorColorIndex));
  v3 = v2;
  swift_bridgeObjectRetain(v2);
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return v4;
}

- (_TtC8Freeform23CRLCollaboratorPresence)init
{
  _TtC8Freeform23CRLCollaboratorPresence *result;

  result = (_TtC8Freeform23CRLCollaboratorPresence *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCollaboratorPresence", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_presenceUUID;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_joinTime;
  v6 = type metadata accessor for Date(0);
  v7 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_lastCursorUpdateTime, v6);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_owner);
  swift_bridgeObjectRelease(*(_QWORD *)&self->owner[OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_displayName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->owner[OBJC_IVAR____TtC8Freeform23CRLCollaboratorPresence_shortDisplayName]);
}

@end

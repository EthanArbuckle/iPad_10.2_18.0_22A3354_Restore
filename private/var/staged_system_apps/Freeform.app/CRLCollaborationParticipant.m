@implementation CRLCollaborationParticipant

- (CKShareParticipant)ckShareParticipant
{
  return (CKShareParticipant *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_ckShareParticipant));
}

- (CNContact)cnContact
{
  return (CNContact *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_cnContact));
}

- (void)setCnContact:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_cnContact);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_cnContact) = (Class)a3;
  v3 = a3;

}

- (BOOL)hasUnifiedContact
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_hasUnifiedContact);
}

- (void)setHasUnifiedContact:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_hasUnifiedContact) = a3;
}

- (_TtC8Freeform27CRLCollaborationParticipant)isFollowing
{
  return (_TtC8Freeform27CRLCollaborationParticipant *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                               + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_isFollowing));
}

- (void)setIsFollowing:(id)a3
{
  id v5;
  _TtC8Freeform27CRLCollaborationParticipant *v6;

  v5 = a3;
  v6 = self;
  sub_100638874(a3);

}

- (NSSet)isFollowedBy
{
  uint64_t KeyPath;
  uint64_t v4;
  _TtC8Freeform27CRLCollaborationParticipant *v5;
  uint64_t v6;
  Class isa;
  uint64_t v9;

  KeyPath = swift_getKeyPath(&unk_100EFF958);
  v4 = swift_getKeyPath(&unk_100EFF980);
  v5 = self;
  static Published.subscript.getter(&v9, v5, KeyPath, v4);

  swift_release(KeyPath);
  swift_release(v4);
  v6 = v9;
  type metadata accessor for CRLCollaborationParticipant(0);
  sub_1004B7878((unint64_t *)&unk_1013E8E30, type metadata accessor for CRLCollaborationParticipant, (uint64_t)&protocol conformance descriptor for NSObject);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return (NSSet *)isa;
}

- (void)setIsFollowedBy:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t v10;

  v5 = type metadata accessor for CRLCollaborationParticipant(0);
  v6 = sub_1004B7878((unint64_t *)&unk_1013E8E30, type metadata accessor for CRLCollaborationParticipant, (uint64_t)&protocol conformance descriptor for NSObject);
  v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
  KeyPath = swift_getKeyPath(&unk_100EFF958);
  v9 = swift_getKeyPath(&unk_100EFF980);
  v10 = v7;
  static Published.subscript.setter(&v10, self, KeyPath, v9);
}

- (BOOL)isFollowable
{
  return sub_100638EF8(self, (uint64_t)a2, (uint64_t)&unk_100EFF9A0, (uint64_t)&unk_100EFF9C8);
}

- (void)setIsFollowable:(BOOL)a3
{
  sub_100639000(self, (uint64_t)a2, a3, (uint64_t)&unk_100EFF9A0, (uint64_t)&unk_100EFF9C8);
}

- (NSUUID)id
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (NSArray)presences
{
  uint64_t KeyPath;
  uint64_t v4;
  _TtC8Freeform27CRLCollaborationParticipant *v5;
  uint64_t v6;
  Class isa;
  uint64_t v9;

  KeyPath = swift_getKeyPath(&unk_100EFF910);
  v4 = swift_getKeyPath(&unk_100EFF938);
  v5 = self;
  static Published.subscript.getter(&v9, v5, KeyPath, v4);

  swift_release(KeyPath);
  swift_release(v4);
  v6 = v9;
  type metadata accessor for CRLCollaboratorPresence(0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return (NSArray *)isa;
}

- (void)setPresences:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  _TtC8Freeform27CRLCollaborationParticipant *v9;
  uint64_t v10;

  v5 = type metadata accessor for CRLCollaboratorPresence(0);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  KeyPath = swift_getKeyPath(&unk_100EFF910);
  v8 = swift_getKeyPath(&unk_100EFF938);
  v10 = v6;
  v9 = self;
  static Published.subscript.setter(&v10, v9, KeyPath, v8);
  sub_100638DC8();

}

- (BOOL)isViewOnly
{
  return sub_100638EF8(self, (uint64_t)a2, (uint64_t)&unk_100EFF8C8, (uint64_t)&unk_100EFF8F0);
}

- (void)setIsViewOnly:(BOOL)a3
{
  sub_100639000(self, (uint64_t)a2, a3, (uint64_t)&unk_100EFF8C8, (uint64_t)&unk_100EFF8F0);
}

- (BOOL)isDocumentOwner
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_isDocumentOwner);
}

- (void)setIsDocumentOwner:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_isDocumentOwner) = a3;
}

- (_TtC8Freeform27CRLCollaborationParticipant)initWithCkShareParticipant:(id)a3 isFollowable:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  _TtC8Freeform27CRLCollaborationParticipant *v6;

  v4 = a4;
  v5 = a3;
  v6 = (_TtC8Freeform27CRLCollaborationParticipant *)sub_100643C98(v5, v4);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _TtC8Freeform27CRLCollaborationParticipant *v5;
  uint64_t v6;
  _TtC8Freeform27CRLCollaborationParticipant *v7;
  BOOL v8;
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
  v8 = sub_1006391D4((uint64_t)v10);

  sub_1004CB800((uint64_t)v10, &qword_1013E0230);
  return v8;
}

- (NSString)description
{
  return (NSString *)sub_100571634(self, (uint64_t)a2, (void (*)(void))sub_100639654);
}

- (void)removePresenceWith:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8Freeform27CRLCollaborationParticipant *v9;
  uint64_t v10;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100639D00((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (id)presenceWith:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t KeyPath;
  uint64_t v10;
  _TtC8Freeform27CRLCollaborationParticipant *v11;
  uint64_t v12;
  void *v13;
  __n128 v14;
  _BYTE v16[16];
  _BYTE *v17;
  uint64_t v18;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  KeyPath = swift_getKeyPath(&unk_100EFF910);
  v10 = swift_getKeyPath(&unk_100EFF938);
  v11 = self;
  static Published.subscript.getter(&v18, v11, KeyPath, v10);
  swift_release(KeyPath);
  swift_release(v10);
  v12 = v18;
  v17 = v8;
  v13 = sub_100C9D0C0((uint64_t (*)(id *))sub_1006456A4, (uint64_t)v16, v18);

  v14 = swift_bridgeObjectRelease(v12);
  (*(void (**)(_BYTE *, uint64_t, __n128))(v6 + 8))(v8, v5, v14);
  return v13;
}

- (BOOL)isActive
{
  uint64_t KeyPath;
  uint64_t v4;
  _TtC8Freeform27CRLCollaborationParticipant *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  KeyPath = swift_getKeyPath(&unk_100EFF910);
  v4 = swift_getKeyPath(&unk_100EFF938);
  v5 = self;
  static Published.subscript.getter(&v10, v5, KeyPath, v4);
  swift_release(KeyPath);
  swift_release(v4);
  v6 = v10;
  if ((unint64_t)v10 >> 62)
  {
    if (v10 < 0)
      v9 = v10;
    else
      v9 = v10 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v10);
    v7 = _CocoaArrayWrapper.endIndex.getter(v9);

    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v7 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);

  }
  swift_bridgeObjectRelease(v6);
  return v7 != 0;
}

- (_TtC8Freeform23CRLCollaboratorPresence)latestPresence
{
  _TtC8Freeform27CRLCollaborationParticipant *v2;
  char *v3;

  v2 = self;
  v3 = sub_10063A120();

  return (_TtC8Freeform23CRLCollaboratorPresence *)v3;
}

- (_TtC8Freeform23CRLCollaboratorPresence)oldestPresence
{
  _TtC8Freeform27CRLCollaborationParticipant *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_10063A3F8();
  v4 = v3;

  return (_TtC8Freeform23CRLCollaboratorPresence *)v4;
}

- (_TtC8Freeform23CRLCollaboratorPresence)localPresence
{
  _TtC8Freeform27CRLCollaborationParticipant *v2;
  _BYTE *v3;

  v2 = self;
  v3 = sub_10063A51C();

  return (_TtC8Freeform23CRLCollaboratorPresence *)v3;
}

- (void)populateContactIfNeeded
{
  _TtC8Freeform27CRLCollaborationParticipant *v2;

  v2 = self;
  sub_10063A69C();

}

- (id)contact
{
  _TtC8Freeform27CRLCollaborationParticipant *v2;
  id v3;

  v2 = self;
  sub_10063A69C();
  v3 = objc_retainAutoreleaseReturnValue(*(id *)((char *)&v2->super.isa
                                               + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_cnContact));

  return v3;
}

- (BOOL)isSelf
{
  _TtC8Freeform27CRLCollaborationParticipant *v2;
  char v3;

  v2 = self;
  v3 = sub_10063A9F4();

  return v3 & 1;
}

- (NSPersonNameComponents)nameComponents
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _TtC8Freeform27CRLCollaborationParticipant *v6;
  uint64_t v7;
  uint64_t v8;
  Class isa;
  uint64_t v11;

  v3 = sub_1004B804C(&qword_1013F4270);
  __chkstk_darwin(v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_10063ABC4((uint64_t)v5);

  v7 = type metadata accessor for PersonNameComponents(0);
  v8 = *(_QWORD *)(v7 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    isa = PersonNameComponents._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSPersonNameComponents *)isa;
}

- (NSString)personName
{
  _TtC8Freeform27CRLCollaborationParticipant *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10063B370();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)displayName
{
  return (NSString *)sub_100571634(self, (uint64_t)a2, (void (*)(void))sub_10063B4E0);
}

- (NSString)shortDisplayName
{
  return (NSString *)sub_100571634(self, (uint64_t)a2, (void (*)(void))sub_10063B92C);
}

- (_TtC8Freeform27CRLCollaborationParticipant)init
{
  _TtC8Freeform27CRLCollaborationParticipant *result;

  result = (_TtC8Freeform27CRLCollaborationParticipant *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCollaborationParticipant", 36, "init()", 6, 0);
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
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  __n128 v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_ckShareParticipant));

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant__isFollowedBy;
  v4 = sub_1004B804C((uint64_t *)&unk_1013E8E20);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant__isFollowable;
  v6 = sub_1004B804C(&qword_10140B9D0);
  v7 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v8 = (char *)self + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_id;
  v9 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant__presences;
  v11 = sub_1004B804C(&qword_1013E8E18);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  v7((char *)self + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant__isViewOnly, v6);
  v12 = swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                           + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_cachedCursorColors));
  v13 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_isFollowing);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_isFollowing) = 0;
  if (v13)
  {
    while (1)
    {
      v16 = v13;
      if (!swift_isUniquelyReferenced(v12))
        break;
      v14 = *(char **)&v16[OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_isFollowing];
      v15 = v14;

      v13 = v14;
      if (!v14)
        goto LABEL_6;
    }
    v13 = v16;
  }
LABEL_6:

}

- (int64_t)collaboratorColorIndex
{
  _TtC8Freeform27CRLCollaborationParticipant *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_10063BF58();
  v4 = v3;

  return v4;
}

- (id)collaboratorColorForType:(int64_t)a3
{
  _TtC8Freeform27CRLCollaborationParticipant *v4;
  id v5;

  v4 = self;
  v5 = sub_10063C070(a3);

  return v5;
}

- (void)updateCachedCollaboratorColors
{
  uint64_t *v3;
  uint64_t v4;
  _TtC8Freeform27CRLCollaborationParticipant *v5;
  uint64_t v6;
  _BYTE v7[24];

  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_cachedCursorColors);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform27CRLCollaborationParticipant_cachedCursorColors, v7, 0, 0);
  v4 = *v3;
  v5 = self;
  swift_bridgeObjectRetain(v4);
  sub_1006447D0(v6, (uint64_t)v5);

  swift_bridgeObjectRelease(v4);
}

- (id)collaboratorColorName
{
  return sub_100571634(self, (uint64_t)a2, (void (*)(void))sub_10063C5B8);
}

@end

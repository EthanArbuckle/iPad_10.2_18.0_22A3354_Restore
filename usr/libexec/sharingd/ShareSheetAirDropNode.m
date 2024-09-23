@implementation ShareSheetAirDropNode

- (NSUUID)nodeIdentifier
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  Class isa;
  _BYTE v12[24];

  v3 = sub_100008384(&qword_1007B7280);
  __chkstk_darwin(v3);
  v5 = &v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_nodeIdentifier;
  swift_beginAccess(v6, v12, 0, 0);
  sub_100221F28((uint64_t)v6, (uint64_t)v5, &qword_1007B7280);
  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSUUID *)isa;
}

- (void)setNodeIdentifier:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC16DaemoniOSLibrary21ShareSheetAirDropNode *v11;
  _BYTE v13[24];

  v5 = sub_100008384(&qword_1007B7280);
  __chkstk_darwin(v5);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = type metadata accessor for UUID(0);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = type metadata accessor for UUID(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_nodeIdentifier;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_nodeIdentifier, v13, 33, 0);
  v11 = self;
  sub_10023A084((uint64_t)v7, (uint64_t)v10, &qword_1007B7280);
  swift_endAccess(v13);

}

- (NSString)contactIdentifier
{
  return (NSString *)sub_1004BB5A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_contactIdentifier);
}

- (void)setContactIdentifier:(id)a3
{
  sub_1004BB604((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_contactIdentifier);
}

- (NSString)displayName
{
  return (NSString *)sub_1004BB5A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_displayName);
}

- (void)setDisplayName:(id)a3
{
  sub_1004BB604((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_displayName);
}

- (NSString)realName
{
  return (NSString *)sub_1004BB5A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_realName);
}

- (void)setRealName:(id)a3
{
  sub_1004BB604((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_realName);
}

- (NSString)model
{
  return (NSString *)sub_1004BB5A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_model);
}

- (void)setModel:(id)a3
{
  sub_1004BB604((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_model);
}

- (NSSet)formattedHandles
{
  uint64_t v2;
  NSSet v3;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_formattedHandles);
  if (v2)
  {
    swift_bridgeObjectRetain(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_formattedHandles));
    v3.super.isa = Set._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3.super.isa = 0;
  }
  return (NSSet *)v3.super.isa;
}

- (void)setFormattedHandles:(id)a3
{
  objc_class *v4;
  uint64_t v5;

  if (a3)
    v4 = (objc_class *)static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, &protocol witness table for AnyHashable);
  else
    v4 = 0;
  v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_formattedHandles);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_formattedHandles) = v4;
  swift_bridgeObjectRelease(v5);
}

- (NSNumber)suggestionIndex
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_suggestionIndex));
}

- (void)setSuggestionIndex:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_suggestionIndex);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_suggestionIndex) = (Class)a3;
  v3 = a3;

}

- (NSString)transportBundleID
{
  return (NSString *)sub_1004BB754((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_transportBundleID);
}

- (void)setTransportBundleID:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_transportBundleID);
  v6 = *(_QWORD *)&self->contactIdentifier[OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_transportBundleID];
  *v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

- (BOOL)isClassroom
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_isClassroom);
}

- (void)setClassroom:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_isClassroom) = a3;
}

- (BOOL)isDisabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_isDisabled);
}

- (void)setDisabled:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_isDisabled) = a3;
}

- (BOOL)isSuggestion
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_isSuggestion);
}

- (void)setSuggestion:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_isSuggestion) = a3;
}

- (int64_t)selectionReason
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_selectionReason);
}

- (void)setSelectionReason:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_selectionReason) = (Class)a3;
}

- (CGImage)displayIcon
{
  return (CGImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_displayIcon));
}

- (void)setDisplayIcon:(CGImage *)a3
{
  CGImage *v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_displayIcon);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_displayIcon) = a3;
  v3 = a3;

}

- (id)displayNameForLocale:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  NSString v11;
  uint64_t v13;

  v5 = sub_100008384(&qword_1007C3390);
  __chkstk_darwin(v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Locale._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = type metadata accessor for Locale(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = type metadata accessor for Locale(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = *(const char **)&self->contactIdentifier[OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_displayName];
  swift_bridgeObjectRetain(v10);
  sub_10000D0F0((uint64_t)v7, &qword_1007C3390);
  if (!v10)
    return 0;
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  return v11;
}

- (NSUUID)endpointUUID
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  Class isa;
  _BYTE v11[24];

  v3 = type metadata accessor for UUID(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_endpointUUID;
  swift_beginAccess(v7, v11, 0, 0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)isa;
}

- (void)setEndpointUUID:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  void (*v10)(char *, _BYTE *, uint64_t);
  _TtC16DaemoniOSLibrary21ShareSheetAirDropNode *v11;
  _BYTE v13[24];

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_endpointUUID;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_endpointUUID, v13, 33, 0);
  v10 = *(void (**)(char *, _BYTE *, uint64_t))(v6 + 40);
  v11 = self;
  v10(v9, v8, v5);
  swift_endAccess(v13);

}

- (CNContact)contact
{
  return (CNContact *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_contact));
}

- (void)setContact:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_contact);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_contact) = (Class)a3;
  v3 = a3;

}

- (NSString)description
{
  _TtC16DaemoniOSLibrary21ShareSheetAirDropNode *v2;
  const char *v3;
  const char *v4;
  NSString v5;

  v2 = self;
  sub_1004BBBB4();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC16DaemoniOSLibrary21ShareSheetAirDropNode)init
{
  _TtC16DaemoniOSLibrary21ShareSheetAirDropNode *result;

  result = (_TtC16DaemoniOSLibrary21ShareSheetAirDropNode *)_swift_stdlib_reportUnimplementedInitializer("DaemoniOSLibrary.ShareSheetAirDropNode", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  double v3;
  double v4;
  double v5;
  double v6;
  char *v7;
  uint64_t v8;

  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_nodeIdentifier, &qword_1007B7280);
  *(_QWORD *)&v3 = swift_bridgeObjectRelease((const char *)*(_QWORD *)&self->contactIdentifier[OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_contactIdentifier]).n128_u64[0];
  *(_QWORD *)&v4 = swift_bridgeObjectRelease((const char *)*(_QWORD *)&self->contactIdentifier[OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_displayName], v3).n128_u64[0];
  *(_QWORD *)&v5 = swift_bridgeObjectRelease((const char *)*(_QWORD *)&self->contactIdentifier[OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_realName], v4).n128_u64[0];
  *(_QWORD *)&v6 = swift_bridgeObjectRelease((const char *)*(_QWORD *)&self->contactIdentifier[OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_model], v5).n128_u64[0];
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_formattedHandles), v6);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_suggestionIndex));
  swift_bridgeObjectRelease(*(const char **)&self->contactIdentifier[OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_transportBundleID]);

  v7 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_endpointUUID;
  v8 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);

}

@end

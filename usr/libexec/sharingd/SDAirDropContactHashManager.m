@implementation SDAirDropContactHashManager

- (_TtC16DaemoniOSLibrary27SDAirDropContactHashManager)init
{
  objc_class *ObjectType;
  id v4;
  char *v5;
  uint64_t v6;
  _BYTE v8[96];
  uint64_t v9[12];

  ObjectType = (objc_class *)swift_getObjectType(self);
  sub_100516088((uint64_t)v9);
  sub_100445140(v9, (uint64_t)v8);
  v4 = objc_allocWithZone(ObjectType);
  v5 = sub_100437880((uint64_t)v8);
  sub_10044517C((uint64_t)v9);
  v6 = swift_getObjectType(self);
  swift_deallocPartialClassInstance(self, v6, 273, 7);
  return (_TtC16DaemoniOSLibrary27SDAirDropContactHashManager *)v5;
}

- (void)cmfSyncAgentBlockListDidChange
{
  _TtC16DaemoniOSLibrary27SDAirDropContactHashManager *v2;

  v2 = self;
  sub_10043A3C4("CMFSyncAgentBlockList change handler called", (uint64_t)&unk_100728F08, (uint64_t)sub_1004451B0, (uint64_t)&unk_100728F20);

}

- (void)contactStoreDidChange
{
  _TtC16DaemoniOSLibrary27SDAirDropContactHashManager *v2;

  v2 = self;
  sub_10043A3C4("Contact Store change handler called", (uint64_t)&unk_100728EB8, (uint64_t)sub_100445124, (uint64_t)&unk_100728ED0);

}

- (void)meCardDidChange
{
  _TtC16DaemoniOSLibrary27SDAirDropContactHashManager *v2;

  v2 = self;
  sub_10043A3C4("MeCard change handler called", (uint64_t)&unk_100728E68, (uint64_t)sub_100445108, (uint64_t)&unk_100728E80);

}

- (void).cxx_destruct
{
  sub_10044517C((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_context);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_contactUpdateCoalescer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_meCardUpdateCoalescer));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_systemMonitor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_hashManagerQ));

  sub_10022E75C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_contactStore));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_hashDB));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_notificationCenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_distributedNotificationCenter));
  sub_1004450A4(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_meCardInfo), *(_QWORD *)&self->context[OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_meCardInfo]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_osTransaction));
}

+ (NSString)kStatusContactsHashesChanged
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)kStatusMeCardChanged
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (id)shared
{
  if (qword_1007B40C8 != -1)
    swift_once(&qword_1007B40C8, sub_100437374);
  return (id)qword_1007C0D08;
}

- (NSString)detailedDescription
{
  _TtC16DaemoniOSLibrary27SDAirDropContactHashManager *v2;
  const char *v3;
  NSString v4;
  _QWORD v6[4];
  _QWORD v7[2];

  v6[2] = self;
  v2 = self;
  OS_dispatch_queue.sync<A>(execute:)(v7, sub_1004450D0, v6, &type metadata for String);

  v3 = (const char *)v7[1];
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void)setMeCard:(id)a3
{
  id v4;
  _TtC16DaemoniOSLibrary27SDAirDropContactHashManager *v5;

  v4 = a3;
  v5 = self;
  sub_100440DF8(v4);

}

- (id)contactForCombinedHash:(id)a3
{
  uint64_t v4;
  const char *v5;
  const char *v6;
  _TtC16DaemoniOSLibrary27SDAirDropContactHashManager *v7;
  uint64_t v8;
  _QWORD v10[7];
  id v11;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v10[2] = self;
  v10[3] = v4;
  v10[4] = v5;
  v7 = self;
  v8 = sub_100008384(&qword_1007C0E78);
  OS_dispatch_queue.sync<A>(execute:)(&v11, sub_100445054, v10, v8);

  swift_bridgeObjectRelease(v6);
  return v11;
}

- (id)contactsForCombinedHash:(id)a3
{
  uint64_t v4;
  const char *v5;
  const char *v6;
  _TtC16DaemoniOSLibrary27SDAirDropContactHashManager *v7;
  uint64_t v8;
  const char *v9;
  Class isa;
  _QWORD v12[7];
  const char *v13;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v12[2] = self;
  v12[3] = v4;
  v12[4] = v5;
  v7 = self;
  v8 = sub_100008384(&qword_1007C0E70);
  OS_dispatch_queue.sync<A>(execute:)(&v13, sub_100445038, v12, v8);

  swift_bridgeObjectRelease(v6);
  v9 = v13;
  sub_100221EDC(0, (unint64_t *)&qword_1007B5470, CNContact_ptr);
  sub_100391DD4();
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return isa;
}

- (id)emailOrPhoneForCombinedHash:(id)a3
{
  uint64_t v4;
  const char *v5;
  const char *v6;
  _TtC16DaemoniOSLibrary27SDAirDropContactHashManager *v7;
  uint64_t v8;
  const char *v9;
  NSString v10;
  _QWORD v12[6];
  uint64_t v13;
  const char *v14;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v12[2] = self;
  v12[3] = v4;
  v12[4] = v5;
  v7 = self;
  v8 = sub_100008384(&qword_1007B54E0);
  OS_dispatch_queue.sync<A>(execute:)(&v13, sub_100445004, v12, v8);

  swift_bridgeObjectRelease(v6);
  v9 = v14;
  if (!v14)
    return 0;
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  return v10;
}

- (id)contactIdentifierForMediumHashes:(id)a3
{
  id v5;
  _TtC16DaemoniOSLibrary27SDAirDropContactHashManager *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  const char *v11;
  NSString v12;
  _QWORD v14[6];
  uint64_t v15;
  const char *v16;

  v5 = a3;
  v6 = self;
  v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;

  v14[2] = v6;
  v14[3] = v7;
  v14[4] = v9;
  v10 = sub_100008384(&qword_1007B54E0);
  OS_dispatch_queue.sync<A>(execute:)(&v15, sub_100444FA0, v14, v10);
  sub_100225AB4(v7, v9);

  v11 = v16;
  if (!v16)
    return 0;
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  return v12;
}

- (BOOL)contactsContainsShortHashes:(id)a3
{
  id v5;
  _TtC16DaemoniOSLibrary27SDAirDropContactHashManager *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v11[7];
  _BOOL8 v12;

  v5 = a3;
  v6 = self;
  v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;

  v11[2] = v6;
  v11[3] = v7;
  v11[4] = v9;
  OS_dispatch_queue.sync<A>(execute:)(&v12, sub_100444E28, v11, &type metadata for Bool);
  sub_100225AB4(v7, v9);

  return v12;
}

+ (NSArray)ContactKeysForChangeHistory
{
  return (NSArray *)sub_10044261C((uint64_t)a1, (uint64_t)a2, &qword_1007B40F0, (const char **)&qword_1007D8488, (uint64_t)sub_10044243C);
}

+ (NSArray)GeneralContactKeysToFetch
{
  return (NSArray *)sub_10044261C((uint64_t)a1, (uint64_t)a2, &qword_1007B40F8, (const char **)&qword_1007D8490, (uint64_t)sub_1004424A0);
}

- (BOOL)dumpDBAtFileURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _TtC16DaemoniOSLibrary27SDAirDropContactHashManager *v9;
  _BYTE v11[16];
  _TtC16DaemoniOSLibrary27SDAirDropContactHashManager *v12;
  _BYTE *v13;
  uint64_t v14;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = self;
  v13 = v8;
  v9 = self;
  OS_dispatch_queue.sync<A>(execute:)(&v14, sub_100444D68, v11, &type metadata for Bool);

  LOBYTE(v9) = v14;
  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  return (char)v9;
}

- (void)rebuildDB
{
  _TtC16DaemoniOSLibrary27SDAirDropContactHashManager *v2;

  v2 = self;
  sub_100442954();

}

+ (id)btleAdvertisementDataForStrings:(id)a3
{
  const char *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  Class isa;

  v3 = (const char *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  v4 = sub_100444C00(v3);
  v6 = v5;
  swift_bridgeObjectRelease(v3);
  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100225AB4(v4, v6);
  return isa;
}

+ (id)obfuscatedShortHashDataForStrings:(id)a3
{
  const char *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  Class isa;

  v3 = (const char *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  v4 = sub_100442D84(v3, 2, 4);
  v6 = v5;
  swift_bridgeObjectRelease(v3);
  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100225AB4(v4, v6);
  return isa;
}

+ (id)obfuscatedMediumHashDataForStrings:(id)a3
{
  const char *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  Class isa;

  v3 = (const char *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  v4 = sub_100442D84(v3, 3, 3);
  v6 = v5;
  swift_bridgeObjectRelease(v3);
  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100225AB4(v4, v6);
  return isa;
}

@end

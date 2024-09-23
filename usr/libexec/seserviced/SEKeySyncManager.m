@implementation SEKeySyncManager

+ (_TtC10seserviced16SEKeySyncManager)singleton
{
  if (qword_1003445D8 != -1)
    swift_once(&qword_1003445D8, sub_1000FB394);
  return (_TtC10seserviced16SEKeySyncManager *)(id)swift_retain(qword_100354C08);
}

- (NSString)ptcViewName
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->$defaultActor[OBJC_IVAR____TtC10seserviced16SEKeySyncManager_ptcViewName + 8];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (_TtC10seserviced16SEKeySyncManager)init
{
  return (_TtC10seserviced16SEKeySyncManager *)sub_1000FB5A4();
}

+ (void)kickOff
{
  swift_getObjCClassMetadata(a1);
  sub_1000FB8D8();
}

- (void)onDarwinNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100063D3C(&qword_100346898);
  __chkstk_darwin(v5, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v8, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100309888, 56, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = v9;
  v13[6] = v11;
  swift_retain_n(self, 2);
  swift_bridgeObjectRetain(v11);
  v14 = sub_1000FC3B4((uint64_t)v8, (uint64_t)&unk_100346D18, (uint64_t)v13);
  swift_release(v14);
  swift_bridgeObjectRelease(v11);
  swift_release(self);
}

- (id)getAvailableTLKForViewName:(id)a3 secureElement:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  Class isa;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = a4;
  swift_retain(self);
  v10 = sub_1000FE014(v6, v8, v9);
  v12 = v11;
  swift_bridgeObjectRelease(v8);
  swift_release(self);

  if (v12 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10006B9B4(v10, v12);
  }
  return isa;
}

- (id)haveAvailableTLKForEncryptedData:(id)a3 secureElement:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  Class v13;

  v8 = a3;
  v9 = a4;
  swift_retain(self);
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;

  v13 = sub_1000FFE30(v10, v12, v9);
  swift_release(self);
  sub_100063CD0(v10, v12);
  return v13;
}

- (void)onAlarm:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  Swift::String v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD v18[2];

  v5 = sub_100063D3C(&qword_100346898);
  __chkstk_darwin(v5, v6);
  v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  strcpy((char *)v18, "Retry Alarm ");
  BYTE5(v18[1]) = 0;
  HIWORD(v18[1]) = -5120;
  swift_retain(self);
  v12._countAndFlagsBits = v9;
  v12._object = v11;
  String.append(_:)(v12);
  v14 = v18[0];
  v13 = v18[1];
  v15 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v8, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject(&unk_1003097B8, 56, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = self;
  v16[5] = v14;
  v16[6] = v13;
  swift_retain(self);
  swift_bridgeObjectRetain(v13);
  v17 = sub_1000FC3B4((uint64_t)v8, (uint64_t)&unk_100346CB0, (uint64_t)v16);
  swift_release(v17);
  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v11);
  swift_release(self);
}

@end

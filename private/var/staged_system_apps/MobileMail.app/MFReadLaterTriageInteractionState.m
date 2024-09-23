@implementation MFReadLaterTriageInteractionState

+ (_TtC10MobileMail33MFReadLaterTriageInteractionState)stateWithMessageListItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v7;
  id v9;

  swift_getObjCClassMetadata(a1);
  v3 = a3;
  v4 = sub_10003A0C8(qword_1005A47A0);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v4);
  swift_getObjCClassMetadata(a1);
  v9 = sub_1002F90E4(v7);
  swift_bridgeObjectRelease(v7);

  return (_TtC10MobileMail33MFReadLaterTriageInteractionState *)v9;
}

+ (_TtC10MobileMail33MFReadLaterTriageInteractionState)stateWithDate:(id)a3
{
  void *v3;
  id v4;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  id v17;

  v10 = a1;
  v17 = a3;
  swift_getObjCClassMetadata(a1);
  v11 = type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = (*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  v14 = (char *)&v6 - v13;
  v15 = (*(_QWORD *)(*(_QWORD *)(sub_10003A0C8(&qword_1005A4F00) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = (void *)__chkstk_darwin(v17);
  v16 = (uint64_t)&v6 - v15;
  v4 = v3;
  if (v17)
  {
    v9 = v17;
    v8 = v17;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v16, v14, v11);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 56))(v16, 0, 1, v11);

  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v16, 1, 1, v11);
  }
  swift_getObjCClassMetadata(v10);
  v7 = sub_1002F93F0(v16);
  sub_100221CBC(v16);
  return (_TtC10MobileMail33MFReadLaterTriageInteractionState *)v7;
}

+ (id)removeDateState
{
  swift_getObjCClassMetadata(a1);
  swift_getObjCClassMetadata(a1);
  return sub_1002F7644();
}

- (BOOL)shouldPresentCustomDatePicker
{
  _TtC10MobileMail33MFReadLaterTriageInteractionState *v2;
  char v5;

  v2 = self;
  v5 = sub_1002F9C14();

  return _convertBoolToObjCBool(_:)(v5 & 1) & 1;
}

- (BOOL)isInitialState
{
  _TtC10MobileMail33MFReadLaterTriageInteractionState *v2;
  char v5;

  v2 = self;
  v5 = sub_1002F9D88();

  return _convertBoolToObjCBool(_:)(v5 & 1) & 1;
}

- (BOOL)isRemoveDate
{
  _TtC10MobileMail33MFReadLaterTriageInteractionState *v2;
  char v5;

  v2 = self;
  v5 = sub_1002F9EE8();

  return _convertBoolToObjCBool(_:)(v5 & 1) & 1;
}

- (BOOL)isCancelled
{
  _TtC10MobileMail33MFReadLaterTriageInteractionState *v2;
  char v5;

  v2 = self;
  v5 = sub_1002FA048();

  return _convertBoolToObjCBool(_:)(v5 & 1) & 1;
}

- (BOOL)hasReadLater
{
  _TtC10MobileMail33MFReadLaterTriageInteractionState *v2;
  char v5;

  v2 = self;
  v5 = sub_1002FA1A8();

  return _convertBoolToObjCBool(_:)(v5 & 1) & 1;
}

- (NSDate)date
{
  uint64_t v3;
  _TtC10MobileMail33MFReadLaterTriageInteractionState *v4;
  uint64_t v6;
  Class isa;
  Class v8;
  unint64_t v9;
  _TtC10MobileMail33MFReadLaterTriageInteractionState *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v10 = self;
  v3 = sub_10003A0C8(&qword_1005A4F00);
  v9 = (*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v3);
  v11 = (uint64_t)&v6 - v9;
  v4 = self;
  sub_1002FA3A4(v11);

  v12 = type metadata accessor for Date(0);
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v13 + 48))(v11, 1) == 1)
  {
    v8 = 0;
  }
  else
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    v8 = isa;
  }
  return (NSDate *)v8;
}

- (_TtC10MobileMail33MFReadLaterTriageInteractionState)init
{
  return (_TtC10MobileMail33MFReadLaterTriageInteractionState *)sub_1002FA464();
}

- (void)perform:(int64_t)a3
{
  _TtC10MobileMail33MFReadLaterTriageInteractionState *v3;

  v3 = self;
  sub_1002FAFDC(a3);

}

- (void)didSelectCustomDate:(id)a3
{
  id v4;
  _TtC10MobileMail33MFReadLaterTriageInteractionState *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC10MobileMail33MFReadLaterTriageInteractionState *v11;

  v11 = self;
  v10 = a3;
  v9 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v9 - 8);
  v6 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = (uint64_t)&v6 - v6;
  v4 = (id)__chkstk_darwin(v10);
  v5 = self;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(v10);
  sub_1002FBC30(v8);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);

}

- (void)removeDate
{
  _TtC10MobileMail33MFReadLaterTriageInteractionState *v2;

  v2 = self;
  sub_1002FC4F4();

}

- (void).cxx_destruct
{
  sub_1002FAD18((uint64_t)self + OBJC_IVAR____TtC10MobileMail33MFReadLaterTriageInteractionState_state);
}

@end

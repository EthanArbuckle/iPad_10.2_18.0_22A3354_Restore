@implementation FTMessage

- (_TtC20FaceTimeMessageStore7Message)ftMessage
{
  return (_TtC20FaceTimeMessageStore7Message *)*(id *)self->ftMessage;
}

- (MPMessageID)identifier
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  objc_class *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  _TtC8FaceTime9FTMessage *v18;
  void (*v19)(char *, uint64_t);
  objc_super v21;

  v3 = type metadata accessor for UUID(0);
  v4 = *(_QWORD *)(v3 - 8);
  v6 = __chkstk_darwin(v3, v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v9);
  v11 = (char *)&v21 - v10;
  v12 = swift_retain(self);
  dispatch thunk of Message.recordUUID.getter(v12);
  v13 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v13(v8, v11, v3);
  v14 = (objc_class *)type metadata accessor for MessageID(0);
  v15 = (char *)objc_allocWithZone(v14);
  v16 = &v15[OBJC_IVAR___MPMessageID_value];
  v13(&v15[OBJC_IVAR___MPMessageID_value], v8, v3);
  v17 = type metadata accessor for MessageID.Value(0);
  swift_storeEnumTagMultiPayload(v16, v17, 1);
  v21.receiver = v15;
  v21.super_class = v14;
  v18 = -[FTMessage init](&v21, "init");
  v19 = *(void (**)(char *, uint64_t))(v4 + 8);
  v19(v8, v3);
  v19(v11, v3);
  swift_release(self);
  return (MPMessageID *)v18;
}

- (NSString)provider
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  v3 = swift_retain(self);
  dispatch thunk of Message.provider.getter(v3);
  v5 = v4;
  swift_release(self);
  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return (NSString *)v6;
}

- (NSUUID)callUUID
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Class isa;
  uint64_t v12;

  v3 = sub_10001283C(&qword_1000A2670);
  __chkstk_darwin(v3, v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = swift_retain(self);
  dispatch thunk of Message.callUUID.getter(v7);
  v8 = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  swift_release(self);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  return (NSUUID *)isa;
}

- (int64_t)messageType
{
  int64_t v3;

  swift_retain(self);
  v3 = sub_10004E620();
  swift_release(self);
  return v3;
}

- (TUHandle)senderHandle
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSString v8;

  v3 = swift_retain(self);
  if ((dispatch thunk of Message.isFromUnknown.getter(v3) & 1) != 0)
  {
    swift_release(self);
    v4 = 0;
  }
  else
  {
    dispatch thunk of Message.from.getter();
    v6 = v5;
    v7 = (void *)objc_opt_self(TUHandle);
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
    v4 = objc_msgSend(v7, "normalizedHandleWithDestinationID:", v8);
    swift_release(self);

  }
  return (TUHandle *)v4;
}

- (NSString)senderDestinationID
{
  return (NSString *)sub_10004E7D8((uint64_t)self, (uint64_t)a2, (uint64_t)&selRef_normalizedValue, (void (*)(uint64_t))sub_10004E84C);
}

- (NSString)senderISOCountryCode
{
  return (NSString *)sub_10004E7D8((uint64_t)self, (uint64_t)a2, (uint64_t)&selRef_isoCountryCode, (void (*)(uint64_t))sub_10004E84C);
}

- (NSString)receiverDestinationID
{
  return (NSString *)sub_10004E7D8((uint64_t)self, (uint64_t)a2, (uint64_t)&selRef_normalizedValue, (void (*)(uint64_t))sub_10004E950);
}

- (NSString)receiverISOCountryCode
{
  return (NSString *)sub_10004E7D8((uint64_t)self, (uint64_t)a2, (uint64_t)&selRef_isoCountryCode, (void (*)(uint64_t))sub_10004E950);
}

- (NSString)callbackDestinationID
{
  uint64_t v3;
  NSString v4;
  uint64_t v5;
  uint64_t v6;

  v3 = swift_retain(self);
  if ((dispatch thunk of Message.isFromUnknown.getter(v3) & 1) != 0)
  {
    swift_release(self);
    v4 = 0;
  }
  else
  {
    dispatch thunk of Message.from.getter();
    v6 = v5;
    swift_release(self);
    v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
  }
  return (NSString *)v4;
}

- (int64_t)folder
{
  int64_t v3;

  swift_retain(self);
  v3 = sub_10004EB24();
  swift_release(self);
  return v3;
}

- (void)setFolder:(int64_t)a3
{
  self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC8FaceTime9FTMessage_isDirty] = 1;
  *(_QWORD *)self->$__lazy_storage_$_dirtyFolder = a3;
  self->$__lazy_storage_$_dirtyFolder[8] = 0;
}

- (BOOL)isRead
{
  char v3;
  uint64_t v4;
  char v5;

  if (self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC8FaceTime9FTMessage_isDirty] == 1)
  {
    swift_retain(self);
    v3 = sub_10004EB9C();
  }
  else
  {
    v4 = swift_retain(self);
    v3 = dispatch thunk of Message.isRead.getter(v4);
  }
  v5 = v3;
  swift_release(self);
  return v5 & 1;
}

- (void)setIsRead:(BOOL)a3
{
  self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC8FaceTime9FTMessage_isDirty] = 1;
  self->$__lazy_storage_$_dirtyRead[0] = a3;
}

- (NSDate)date
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  Class isa;
  uint64_t v11;

  v3 = type metadata accessor for Date(0, a2);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = swift_retain(self);
  dispatch thunk of Message.dateCreated.getter(v8);
  swift_release(self);
  isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return (NSDate *)isa;
}

- (BOOL)isTranscriptionAvailable
{
  return sub_10004FD4C((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_10004ED0C);
}

- (double)duration
{
  uint64_t v3;
  double v4;

  v3 = swift_retain(self);
  v4 = dispatch thunk of Message.duration.getter(v3);
  swift_release(self);
  return v4;
}

- (BOOL)isTranscriptionRated
{
  return 0;
}

- (BOOL)isTranscribing
{
  return 0;
}

- (BOOL)transcriptionAttempted
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  unsigned __int16 v6;

  v3 = swift_retain(self);
  v4 = dispatch thunk of Message.transcriptionStatus.getter(v3);
  v5 = (unsigned __int16)TranscriptionStatus.rawValue.getter(v4);
  v6 = TranscriptionStatus.rawValue.getter(0);
  swift_release(self);
  return v5 != v6;
}

- (BOOL)isDeleted
{
  return sub_10004F3E8() & 1;
}

- (void)setIsDeleted:(BOOL)a3
{
  self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC8FaceTime9FTMessage_isDirty] = 1;
  self->$__lazy_storage_$_isDeleted[0] = a3;
}

- (BOOL)isSensitive
{
  return sub_10004FCFC((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))&dispatch thunk of Message.isSensitive.getter);
}

- (NSURL)dataURL
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSURL *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v3 = sub_10001283C((uint64_t *)&unk_1000A24B0);
  __chkstk_darwin(v3, v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain(self);
  sub_10004F4F4((uint64_t)v6);
  swift_release(self);
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    URL._bridgeToObjectiveC()(v9);
    v10 = v11;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  return (NSURL *)v10;
}

- (void)setDataURL:(id)a3
{
  sub_10004FB70((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___dataURL);
}

- (NSURL)thumbnailURL
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSURL *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v3 = sub_10001283C((uint64_t *)&unk_1000A24B0);
  __chkstk_darwin(v3, v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain(self);
  sub_10004F898(&OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___thumbnailURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxThumbnailFile.getter, (uint64_t)v6);
  swift_release(self);
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    URL._bridgeToObjectiveC()(v9);
    v10 = v11;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  return (NSURL *)v10;
}

- (void)setThumbnailURL:(id)a3
{
  sub_10004FB70((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___thumbnailURL);
}

- (BOOL)isRTT
{
  return sub_10004FCFC((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))&dispatch thunk of Message.isRTT.getter);
}

- (BOOL)isDataAvailable
{
  return sub_10004FD4C((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_10004FD84);
}

- (MPTranscriptMessage)transcript
{
  void *v3;

  swift_retain(self);
  v3 = (void *)sub_10004F130();
  swift_release(self);
  return (MPTranscriptMessage *)v3;
}

- (void)setTranscript:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)&self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___transcript];
  *(_QWORD *)&self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___transcript] = a3;
  swift_unknownObjectRetain(a3);
  sub_100051CA8(v3, v4);
}

- (BOOL)shouldMarkAsReadForPlaybackCurrentTime:(double)a3
{
  uint64_t v5;
  BOOL v6;

  v5 = swift_retain(self);
  v6 = sub_100050828(v5, a3);
  swift_release(self);
  return v6;
}

- (id)contactUsingContactStore:(id)a3 withKeysToFetch:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  v7 = sub_10001283C(&qword_1000A24A0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  swift_retain(self);
  v10 = sub_1000508F0(v9);

  swift_release(self);
  swift_bridgeObjectRelease(v8);
  return v10;
}

- (id)displayNameUsingContactStore:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;

  v4 = a3;
  swift_retain(self);
  sub_100050AD4(v4);
  v6 = v5;

  swift_release(self);
  if (v6)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end

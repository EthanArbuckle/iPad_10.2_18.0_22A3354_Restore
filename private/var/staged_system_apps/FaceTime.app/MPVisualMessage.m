@implementation MPVisualMessage

- (VMVoicemail)vmMessage
{
  return (VMVoicemail *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR___MPVisualMessage_vmMessage));
}

- (MPMessageID)identifier
{
  void *v2;
  MPVisualMessage *v3;
  id v4;
  objc_class *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  MPVisualMessage *v9;
  objc_super v11;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage);
  v3 = self;
  v4 = objc_msgSend(v2, "identifier");
  v5 = (objc_class *)type metadata accessor for MessageID(0);
  v6 = (char *)objc_allocWithZone(v5);
  v7 = &v6[OBJC_IVAR___MPMessageID_value];
  *(_QWORD *)&v6[OBJC_IVAR___MPMessageID_value] = v4;
  v8 = type metadata accessor for MessageID.Value(0);
  swift_storeEnumTagMultiPayload(v7, v8, 0);
  v11.receiver = v6;
  v11.super_class = v5;
  v9 = -[MPVisualMessage init](&v11, "init");

  return (MPMessageID *)v9;
}

- (NSString)provider
{
  void *v3;
  MPVisualMessage *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;

  v3 = (void *)objc_opt_self(TUCallCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "sharedInstance");
  v6 = objc_msgSend(v5, "providerManager");

  v7 = objc_msgSend(v6, "telephonyProvider");
  v8 = objc_msgSend(v7, "identifier");

  static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v10 = v9;

  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  return (NSString *)v11;
}

- (int64_t)messageType
{
  return 1;
}

- (NSUUID)callUUID
{
  return (NSUUID *)0;
}

- (TUHandle)senderHandle
{
  void *v2;
  MPVisualMessage *v3;
  id v4;
  void *v5;
  void *v6;
  MPVisualMessage *v7;
  id v8;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage);
  v3 = self;
  v4 = objc_msgSend(v2, "senderDestinationID");
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_opt_self(TUHandle);
    v7 = (MPVisualMessage *)objc_msgSend(v2, "senderISOCountryCode");
    v8 = objc_msgSend(v6, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v5, v7);

    v3 = v7;
  }
  else
  {
    v8 = 0;
  }

  return (TUHandle *)v8;
}

- (NSString)senderDestinationID
{
  return (NSString *)sub_100041DC4((char *)self, (uint64_t)a2, (SEL *)&selRef_senderDestinationID);
}

- (NSString)senderISOCountryCode
{
  return (NSString *)sub_100041DC4((char *)self, (uint64_t)a2, (SEL *)&selRef_senderISOCountryCode);
}

- (NSString)receiverDestinationID
{
  return (NSString *)sub_100041DC4((char *)self, (uint64_t)a2, (SEL *)&selRef_receiverDestinationID);
}

- (NSString)receiverISOCountryCode
{
  return (NSString *)sub_100041DC4((char *)self, (uint64_t)a2, (SEL *)&selRef_receiverISOCountryCode);
}

- (NSString)callbackDestinationID
{
  return (NSString *)sub_100041DC4((char *)self, (uint64_t)a2, (SEL *)&selRef_callbackDestinationID);
}

- (int64_t)folder
{
  void *v2;
  MPVisualMessage *v3;
  int64_t v5;
  unsigned int v6;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage);
  v3 = self;
  if (objc_msgSend(v2, "isDeleted"))
  {

    return 0;
  }
  else
  {
    if (objc_msgSend(v2, "isBlocked"))
      v5 = 4;
    else
      v5 = 1;
    v6 = objc_msgSend(v2, "isTrashed");

    if (v6)
      return 2;
    else
      return v5;
  }
}

- (BOOL)isRead
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage), "isRead");
}

- (NSDate)date
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  MPVisualMessage *v8;
  id v9;
  Class isa;
  uint64_t v12;

  v3 = type metadata accessor for Date(0, a2);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage);
  v8 = self;
  v9 = objc_msgSend(v7, "date");
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)isa;
}

- (BOOL)isTranscriptionAvailable
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage), "isTranscriptionAvailable");
}

- (double)duration
{
  double result;

  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage), "duration");
  return result;
}

- (BOOL)isTranscriptionRated
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage), "isTranscriptionRated");
}

- (BOOL)isTranscribing
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage), "transcriptionState") == (id)2;
}

- (BOOL)transcriptionAttempted
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage), "transcriptionState") == (id)3;
}

- (MPTranscriptMessage)transcript
{
  void *v2;
  MPVisualMessage *v3;
  MPVisualMessage *v4;
  objc_class *v5;
  char *v6;
  objc_super v8;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage);
  v3 = self;
  v4 = (MPVisualMessage *)objc_msgSend(v2, "transcript");
  if (v4)
  {
    v5 = (objc_class *)type metadata accessor for VisualTranscriptionMessage();
    v6 = (char *)objc_allocWithZone(v5);
    *(_QWORD *)&v6[OBJC_IVAR___MPVisualTranscriptionMessage_vmTranscript] = v4;
    v8.receiver = v6;
    v8.super_class = v5;
    v4 = -[MPVisualMessage init](&v8, "init");
  }

  return (MPTranscriptMessage *)v4;
}

- (BOOL)isDeleted
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage), "isDeleted");
}

- (BOOL)isSensitive
{
  return 0;
}

- (NSURL)dataURL
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  MPVisualMessage *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSURL *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v3 = sub_10001283C((uint64_t *)&unk_1000A24B0);
  __chkstk_darwin(v3, v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage);
  v8 = self;
  v9 = objc_msgSend(v7, "dataURL");
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  v10 = type metadata accessor for URL(0);
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);

  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 1, v10) != 1)
  {
    URL._bridgeToObjectiveC()(v12);
    v13 = v14;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v10);
  }
  return (NSURL *)v13;
}

- (NSURL)thumbnailURL
{
  return (NSURL *)0;
}

- (BOOL)isDataAvailable
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage), "isDataAvailable");
}

- (MPVisualMessage)initWithVMVoicemail:(id)a3
{
  return (MPVisualMessage *)sub_100042260((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___MPVisualMessage_vmMessage, type metadata accessor for VisualMessage);
}

- (BOOL)shouldMarkAsReadForPlaybackCurrentTime:(double)a3
{
  *(float *)&a3 = a3;
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage), "shouldMarkAsReadForPlaybackCurrentTime:", a3);
}

- (id)contactUsingContactStore:(id)a3 withKeysToFetch:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  MPVisualMessage *v11;
  uint64_t v12;
  Class isa;
  id v14;

  v7 = sub_10001283C(&qword_1000A24A0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage);
  v10 = a3;
  v11 = self;
  v12 = sub_1000422CC(v8);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v12);
  v14 = objc_msgSend(v9, "contactUsingContactStore:withKeysToFetch:", v10, isa);

  swift_bridgeObjectRelease(v8);
  return v14;
}

- (id)displayNameUsingContactStore:(id)a3
{
  void *v4;
  id v5;
  MPVisualMessage *v6;
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  NSString v11;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage);
  v5 = a3;
  v6 = self;
  v7 = objc_msgSend(v4, "displayNameUsingContactStore:", v5);
  if (v7)
  {
    v8 = v7;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
    v10 = v9;

  }
  else
  {

    v10 = 0xE000000000000000;
  }
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  return v11;
}

- (MPVisualMessage)init
{
  MPVisualMessage *result;

  result = (MPVisualMessage *)_swift_stdlib_reportUnimplementedInitializer("FaceTime.VisualMessage", 22, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end

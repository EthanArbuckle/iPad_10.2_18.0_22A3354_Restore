@implementation JSMusicKitHTTPRequest

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC11MusicJSCore21JSMusicKitHTTPRequest *v5;
  id v6;
  id v7;
  _TtC11MusicJSCore21JSMusicKitHTTPRequest *v8;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11MusicJSCore21JSMusicKitHTTPRequest_urlRequest);
  if (v4)
  {
    sub_4E684(0, (unint64_t *)&unk_14C4B50, ICURLSessionManager_ptr);
    v5 = self;
    v6 = v4;
    v7 = static ICURLSessionManager.musicSession.getter();
    objc_msgSend(v7, "cancelRequest:", v6);

  }
  else
  {
    v8 = self;
  }
  v9.receiver = self;
  v9.super_class = ObjectType;
  -[JSObject dealloc](&v9, "dealloc");
}

- (void).cxx_destruct
{
  sub_56024((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore21JSMusicKitHTTPRequest_url, &qword_14AED20);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC11MusicJSCore21JSMusicKitHTTPRequest_body));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_50C4C(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC11MusicJSCore21JSMusicKitHTTPRequest_mockedResponse), *(_QWORD *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore21JSMusicKitHTTPRequest_mockedResponse]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore21JSMusicKitHTTPRequest_urlRequest));
  swift_bridgeObjectRelease();
  sub_50C60(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11MusicJSCore21JSMusicKitHTTPRequest_receivedData), *(_QWORD *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore21JSMusicKitHTTPRequest_receivedData]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore21JSMusicKitHTTPRequest_response));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore21JSMusicKitHTTPRequest_responseExpirationDate, (uint64_t *)&unk_14AD5F0);
}

@end

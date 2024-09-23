@implementation CRLSEExtensionContextManager

+ (NSString)defaultImageFileName
{
  id v2;
  NSString v3;
  NSString v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v2 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v3 = String._bridgeToObjectiveC()();
  v4 = String._bridgeToObjectiveC()();
  v5 = objc_msgSend(v2, "localizedStringForKey:value:table:", v3, v4, 0);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v7 = v6;

  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  return (NSString *)v8;
}

- (NSURL)presentedItemURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSURL *v9;
  void *v10;
  void *v11;
  _BYTE v14[24];

  v3 = sub_100011254(&qword_10006D050);
  __chkstk_darwin(v3);
  v5 = &v14[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = (char *)self + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_presentedItemURL;
  swift_beginAccess(v6, v14, 0, 0);
  sub_100019B3C((uint64_t)v6, (uint64_t)v5, &qword_10006D050);
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    URL._bridgeToObjectiveC()(v9);
    v10 = v11;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v10;
}

- (void)setPresentedItemURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC24FreeformSharingExtension28CRLSEExtensionContextManager *v11;
  _BYTE v13[24];

  v5 = sub_100011254(&qword_10006D050);
  __chkstk_darwin(v5);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = type metadata accessor for URL(0);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = type metadata accessor for URL(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_presentedItemURL;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_presentedItemURL, v13, 33, 0);
  v11 = self;
  sub_10002D894((uint64_t)v7, (uint64_t)v10, &qword_10006D050);
  swift_endAccess(v13);

}

- (NSOperationQueue)presentedItemOperationQueue
{
  _TtC24FreeformSharingExtension28CRLSEExtensionContextManager *v2;
  id v3;

  v2 = self;
  v3 = sub_100032C68();

  return (NSOperationQueue *)v3;
}

- (void)setPresentedItemOperationQueue:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager____lazy_storage___presentedItemOperationQueue);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager____lazy_storage___presentedItemOperationQueue) = (Class)a3;
  v3 = a3;

}

- (_TtC24FreeformSharingExtension28CRLSEExtensionContextManager)init
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t, uint64_t, uint64_t);
  objc_super v7;

  v3 = (char *)self + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_containerURL;
  v4 = type metadata accessor for URL(0);
  v5 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56);
  v5(v3, 1, 1, v4);
  v5((char *)self + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_importDirectoryURL, 1, 1, v4);
  v5((char *)self + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_presentedItemURL, 1, 1, v4);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager____lazy_storage___presentedItemOperationQueue) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLSEExtensionContextManager(0);
  return -[CRLSEExtensionContextManager init](&v7, "init");
}

- (void).cxx_destruct
{
  sub_100019B80((uint64_t)self + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_containerURL, &qword_10006D050);
  sub_100019B80((uint64_t)self + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_importDirectoryURL, &qword_10006D050);
  sub_100019B80((uint64_t)self + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_presentedItemURL, &qword_10006D050);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager____lazy_storage___presentedItemOperationQueue));
}

@end

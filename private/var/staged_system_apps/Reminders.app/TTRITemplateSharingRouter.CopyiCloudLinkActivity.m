@implementation TTRITemplateSharingRouter.CopyiCloudLinkActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (NSString)activityType
{
  uint64_t v2;
  _TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C822CopyiCloudLinkActivity *v3;
  NSString *v4;

  v2 = qword_10063D488;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_10063D488, sub_1001D6FD4);
  v4 = (NSString *)(id)qword_10064B6E8;

  return v4;
}

- (NSString)activityTitle
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  static TTRLocalizableStrings.Templates.copyIcloudLink.getter(self, a2);
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (UIImage)activityImage
{
  _TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C822CopyiCloudLinkActivity *v3;
  void *v4;

  sub_100005ED8(0, (unint64_t *)&unk_100642D70, UIImage_ptr);
  v3 = self;
  v4 = (void *)static UIImage.ttr_systemSymbolImage(named:)(1802398060, 0xE400000000000000);

  return (UIImage *)v4;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v4;
  _TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C822CopyiCloudLinkActivity *v5;
  BOOL v6;

  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for Any[8]);
  v5 = self;
  v6 = sub_1001D712C(v4);

  swift_bridgeObjectRelease(v4);
  return v6;
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v4;
  _TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C822CopyiCloudLinkActivity *v5;

  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for Any[8]);
  v5 = self;
  sub_1001D69F0(v4);

  swift_bridgeObjectRelease(v4);
}

- (void)performActivity
{
  _TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C822CopyiCloudLinkActivity *v2;

  v2 = self;
  sub_1001D6B5C();

}

- (_TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C822CopyiCloudLinkActivity)init
{
  objc_class *ObjectType;
  char *v4;
  uint64_t v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = (char *)self
     + OBJC_IVAR____TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C822CopyiCloudLinkActivity_urlToBeCopiedToPasteboard;
  v5 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[TTRITemplateSharingRouter.CopyiCloudLinkActivity init](&v7, "init");
}

- (void).cxx_destruct
{
  sub_1001D70A4((uint64_t)self+ OBJC_IVAR____TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C822CopyiCloudLinkActivity_urlToBeCopiedToPasteboard);
}

@end

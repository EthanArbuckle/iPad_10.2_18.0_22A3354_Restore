@implementation JSACopyLinkActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (NSString)activityType
{
  JSACopyLinkActivity *v2;
  NSString v3;

  v2 = self;
  v3 = String._bridgeToObjectiveC()();

  return (NSString *)v3;
}

- (NSString)activityTitle
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  sub_58064();
  if (v2)
  {
    v3 = v2;
    v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (UIImage)activityImage
{
  JSACopyLinkActivity *v2;
  NSString v3;
  id v4;

  v2 = self;
  v3 = String._bridgeToObjectiveC()();
  v4 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:", v3);

  return (UIImage *)v4;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v4;
  JSACopyLinkActivity *v5;
  char v6;

  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
  v5 = self;
  v6 = sub_5813C(v4);

  swift_bridgeObjectRelease(v4);
  return v6 & 1;
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v4;
  JSACopyLinkActivity *v5;

  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
  v5 = self;
  sub_571F8(v4);

  swift_bridgeObjectRelease(v4);
}

- (void)performActivity
{
  JSACopyLinkActivity *v2;

  v2 = self;
  sub_57524();

}

- (JSACopyLinkActivity)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___JSACopyLinkActivity_items) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CopyLinkActivity();
  return -[JSACopyLinkActivity init](&v3, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR___JSACopyLinkActivity_items));
}

@end

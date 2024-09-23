@implementation CRLiOSExportAsPDFActivity

- (NSString)activityType
{
  uint64_t v2;
  _TtC8Freeform25CRLiOSExportAsPDFActivity *v3;
  NSString *v4;

  v2 = qword_1013DD018;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_1013DD018, sub_10075B884);
  v4 = (NSString *)(id)qword_1013F0540;

  return v4;
}

- (NSString)activityTitle
{
  void *v3;
  _TtC8Freeform25CRLiOSExportAsPDFActivity *v4;
  id v5;
  NSString v6;
  NSString v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;

  v3 = (void *)objc_opt_self(NSBundle);
  v4 = self;
  v5 = objc_msgSend(v3, "mainBundle");
  v6 = String._bridgeToObjectiveC()();
  v7 = String._bridgeToObjectiveC()();
  v8 = objc_msgSend(v5, "localizedStringForKey:value:table:", v6, v7, 0);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v10 = v9;

  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  return (NSString *)v11;
}

- (UIImage)activityImage
{
  return (UIImage *)0;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  _TtC8Freeform25CRLiOSExportAsPDFActivity *v2;

  v2 = self;
  sub_10075B194();

}

+ (int64_t)activityCategory
{
  return 0;
}

- (_TtC8Freeform25CRLiOSExportAsPDFActivity)init
{
  _TtC8Freeform25CRLiOSExportAsPDFActivity *result;

  result = (_TtC8Freeform25CRLiOSExportAsPDFActivity *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSExportAsPDFActivity", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC8Freeform25CRLiOSExportAsPDFActivity_boardActor));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform25CRLiOSExportAsPDFActivity_viewControllerToPresentFrom);

}

@end

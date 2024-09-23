@implementation DownloadWorkoutShareSheetActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (NSString)activityType
{
  uint64_t v2;
  _TtC9SeymourUI33DownloadWorkoutShareSheetActivity *v3;
  NSString *v4;

  v2 = qword_255B82530;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = (NSString *)(id)qword_255BE5C80;

  return v4;
}

- (NSString)activityTitle
{
  uint64_t ObjCClassFromMetadata;
  void *v4;
  _TtC9SeymourUI33DownloadWorkoutShareSheetActivity *v5;
  id v6;
  void *v7;

  type metadata accessor for SeymourLocalizationBundle();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_22BA795C0();

  v7 = (void *)sub_22BA8064C();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (UIImage)activityImage
{
  _TtC9SeymourUI33DownloadWorkoutShareSheetActivity *v2;
  void *v3;
  id v4;

  v2 = self;
  v3 = (void *)sub_22BA8064C();
  v4 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_, v3);

  return (UIImage *)v4;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v4;
  _TtC9SeymourUI33DownloadWorkoutShareSheetActivity *v5;
  char v6;

  v4 = sub_22BA808BC();
  v5 = self;
  v6 = sub_22B199A14(v4);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v4;
  _TtC9SeymourUI33DownloadWorkoutShareSheetActivity *v5;

  v4 = sub_22BA808BC();
  v5 = self;
  sub_22B4013CC(v4);

  swift_bridgeObjectRelease();
}

- (void)performActivity
{
  _TtC9SeymourUI33DownloadWorkoutShareSheetActivity *v2;

  v2 = self;
  sub_22B4014FC();

}

- (_TtC9SeymourUI33DownloadWorkoutShareSheetActivity)init
{
  _TtC9SeymourUI33DownloadWorkoutShareSheetActivity *result;

  result = (_TtC9SeymourUI33DownloadWorkoutShareSheetActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33DownloadWorkoutShareSheetActivity_assetClient);
  swift_bridgeObjectRelease();
}

@end

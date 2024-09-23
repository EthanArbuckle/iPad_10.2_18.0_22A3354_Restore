@implementation AddToWatchShareSheetActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (NSString)activityType
{
  uint64_t v2;
  _TtC9SeymourUI28AddToWatchShareSheetActivity *v3;
  NSString *v4;

  v2 = qword_255B82520;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = (NSString *)(id)qword_255BE5C70;

  return v4;
}

- (NSString)activityTitle
{
  _TtC9SeymourUI28AddToWatchShareSheetActivity *v3;
  void *v4;

  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC9SeymourUI28AddToWatchShareSheetActivity_storefrontLocalizer), *(uint64_t *)((char *)&self->super._activitySettingsImageLoader+ OBJC_IVAR____TtC9SeymourUI28AddToWatchShareSheetActivity_storefrontLocalizer));
  v3 = self;
  sub_22BA7DD3C();

  v4 = (void *)sub_22BA8064C();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (UIImage)activityImage
{
  _TtC9SeymourUI28AddToWatchShareSheetActivity *v2;
  void *v3;
  id v4;

  v2 = self;
  v3 = (void *)sub_22BA8064C();
  v4 = objc_msgSend((id)objc_opt_self(), sel_smm_systemImageNamed_, v3);

  return (UIImage *)v4;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v4;
  _TtC9SeymourUI28AddToWatchShareSheetActivity *v5;
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
  _TtC9SeymourUI28AddToWatchShareSheetActivity *v5;

  v4 = sub_22BA808BC();
  v5 = self;
  sub_22B199624(v4);

  swift_bridgeObjectRelease();
}

- (void)performActivity
{
  _TtC9SeymourUI28AddToWatchShareSheetActivity *v2;

  v2 = self;
  sub_22B199754();

}

- (_TtC9SeymourUI28AddToWatchShareSheetActivity)init
{
  _TtC9SeymourUI28AddToWatchShareSheetActivity *result;

  result = (_TtC9SeymourUI28AddToWatchShareSheetActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28AddToWatchShareSheetActivity_assetClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28AddToWatchShareSheetActivity_storefrontLocalizer);
  swift_bridgeObjectRelease();
}

@end

@implementation RemoveFromWatchShareSheetActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (NSString)activityType
{
  uint64_t v2;
  _TtC9SeymourUI33RemoveFromWatchShareSheetActivity *v3;
  NSString *v4;

  v2 = qword_255B82548;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = (NSString *)(id)qword_255BE5C98;

  return v4;
}

- (NSString)activityTitle
{
  _TtC9SeymourUI33RemoveFromWatchShareSheetActivity *v3;
  void *v4;

  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC9SeymourUI33RemoveFromWatchShareSheetActivity_storefrontLocalizer), *(uint64_t *)((char *)&self->super._activitySettingsImageLoader+ OBJC_IVAR____TtC9SeymourUI33RemoveFromWatchShareSheetActivity_storefrontLocalizer));
  v3 = self;
  sub_22BA7DD3C();

  v4 = (void *)sub_22BA8064C();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (UIImage)activityImage
{
  void *v3;
  _TtC9SeymourUI33RemoveFromWatchShareSheetActivity *v4;
  id v5;
  void *v6;
  _TtC9SeymourUI33RemoveFromWatchShareSheetActivity *v7;
  id v8;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_configurationWithScale_, 3);
  v6 = (void *)sub_22BA8064C();
  v7 = (_TtC9SeymourUI33RemoveFromWatchShareSheetActivity *)objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_, v6);

  if (v7)
  {
    v8 = -[RemoveFromWatchShareSheetActivity imageWithConfiguration:](v7, sel_imageWithConfiguration_, v5);

    v4 = v7;
  }
  else
  {
    v8 = 0;
  }

  return (UIImage *)v8;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v4;
  _TtC9SeymourUI33RemoveFromWatchShareSheetActivity *v5;
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
  _TtC9SeymourUI33RemoveFromWatchShareSheetActivity *v5;

  v4 = sub_22BA808BC();
  v5 = self;
  sub_22B6D28B0(v4);

  swift_bridgeObjectRelease();
}

- (void)performActivity
{
  _TtC9SeymourUI33RemoveFromWatchShareSheetActivity *v2;

  v2 = self;
  sub_22B6D29E0();

}

- (_TtC9SeymourUI33RemoveFromWatchShareSheetActivity)init
{
  _TtC9SeymourUI33RemoveFromWatchShareSheetActivity *result;

  result = (_TtC9SeymourUI33RemoveFromWatchShareSheetActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33RemoveFromWatchShareSheetActivity_assetClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33RemoveFromWatchShareSheetActivity_storefrontLocalizer);
  swift_bridgeObjectRelease();
}

@end

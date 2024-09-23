@implementation RemoveUpNextQueueShareSheetActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (NSString)activityType
{
  uint64_t v2;
  _TtC9SeymourUI35RemoveUpNextQueueShareSheetActivity *v3;
  NSString *v4;

  v2 = qword_255B82550;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = (NSString *)(id)qword_255BE5CA0;

  return v4;
}

- (NSString)activityTitle
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_22BA8064C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (UIImage)activityImage
{
  _TtC9SeymourUI35RemoveUpNextQueueShareSheetActivity *v2;
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
  _TtC9SeymourUI35RemoveUpNextQueueShareSheetActivity *v5;
  char v6;

  v4 = sub_22BA808BC();
  v5 = self;
  v6 = sub_22B990618(v4);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)performActivity
{
  _TtC9SeymourUI35RemoveUpNextQueueShareSheetActivity *v2;

  v2 = self;
  sub_22BA34ED4();

}

- (_TtC9SeymourUI35RemoveUpNextQueueShareSheetActivity)init
{
  _TtC9SeymourUI35RemoveUpNextQueueShareSheetActivity *result;

  result = (_TtC9SeymourUI35RemoveUpNextQueueShareSheetActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI35RemoveUpNextQueueShareSheetActivity_upNextQueueClient);
  swift_bridgeObjectRelease();
}

@end

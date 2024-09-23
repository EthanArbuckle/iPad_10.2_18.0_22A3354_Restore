@implementation AddBookmarkShareSheetActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (NSString)activityType
{
  uint64_t v2;
  _TtC9SeymourUI29AddBookmarkShareSheetActivity *v3;
  NSString *v4;

  v2 = qword_255B82518;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = (NSString *)(id)qword_255BE5C68;

  return v4;
}

- (NSString)activityTitle
{
  uint64_t ObjCClassFromMetadata;
  void *v4;
  _TtC9SeymourUI29AddBookmarkShareSheetActivity *v5;
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
  _TtC9SeymourUI29AddBookmarkShareSheetActivity *v2;
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
  _TtC9SeymourUI29AddBookmarkShareSheetActivity *v5;
  char v6;

  v4 = sub_22BA808BC();
  v5 = self;
  v6 = sub_22B706040(v4);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v4;
  _TtC9SeymourUI29AddBookmarkShareSheetActivity *v5;

  v4 = sub_22BA808BC();
  v5 = self;
  sub_22B93F52C(v4);

  swift_bridgeObjectRelease();
}

- (void)performActivity
{
  _TtC9SeymourUI29AddBookmarkShareSheetActivity *v2;

  v2 = self;
  sub_22B93F658();

}

- (_TtC9SeymourUI29AddBookmarkShareSheetActivity)init
{
  _TtC9SeymourUI29AddBookmarkShareSheetActivity *result;

  result = (_TtC9SeymourUI29AddBookmarkShareSheetActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI29AddBookmarkShareSheetActivity_bookmarkClient);
  swift_bridgeObjectRelease();
}

@end

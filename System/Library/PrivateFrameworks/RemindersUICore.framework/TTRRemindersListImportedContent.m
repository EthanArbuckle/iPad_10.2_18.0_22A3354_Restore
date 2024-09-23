@implementation TTRRemindersListImportedContent

- (NSString)description
{
  return (NSString *)sub_1B428F9E8(self, (uint64_t)a2, (void (*)(void))TTRRemindersListImportedContent.description.getter);
}

- (NSString)debugDescription
{
  return (NSString *)sub_1B428F9E8(self, (uint64_t)a2, (void (*)(void))TTRRemindersListImportedContent.debugDescription.getter);
}

- (_TtC15RemindersUICore31TTRRemindersListImportedContent)init
{
  _TtC15RemindersUICore31TTRRemindersListImportedContent *result;

  result = (_TtC15RemindersUICore31TTRRemindersListImportedContent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B41EA560((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore31TTRRemindersListImportedContent_url, &qword_1ED4E9EC0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRRemindersListImportedContent_userActivity));
  sub_1B41EA560((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore31TTRRemindersListImportedContent_image, &qword_1EF09BCA8);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRRemindersListImportedContent_copyPasteItem));
}

@end

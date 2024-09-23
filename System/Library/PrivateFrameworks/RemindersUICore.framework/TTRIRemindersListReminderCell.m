@implementation TTRIRemindersListReminderCell

- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  char *v6;
  uint64_t v7;
  void (*v8)(void);
  id v9;
  _TtC15RemindersUICore29TTRIRemindersListReminderCell *v10;

  v6 = (char *)self + direct field offset for TTRIRemindersListReminderCell.delegate;
  swift_beginAccess();
  if (MEMORY[0x1B5E3D8DC](v6))
  {
    v7 = *((_QWORD *)v6 + 1);
    swift_getObjectType();
    v8 = *(void (**)(void))(v7 + 88);
    v9 = a3;
    swift_unknownObjectRetain();
    v10 = self;
    v8();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
}

- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4
{
  char *v6;
  uint64_t v7;
  void (*v8)(void);
  id v9;
  _TtC15RemindersUICore29TTRIRemindersListReminderCell *v10;

  v6 = (char *)self + direct field offset for TTRIRemindersListReminderCell.delegate;
  swift_beginAccess();
  if (MEMORY[0x1B5E3D8DC](v6))
  {
    v7 = *((_QWORD *)v6 + 1);
    swift_getObjectType();
    v8 = *(void (**)(void))(v7 + 96);
    v9 = a3;
    swift_unknownObjectRetain();
    v10 = self;
    v8();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  return 0;
}

@end

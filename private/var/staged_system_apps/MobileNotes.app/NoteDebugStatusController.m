@implementation NoteDebugStatusController

+ (_TtC11MobileNotes25NoteDebugStatusController)sharedController
{
  if (qword_1005CECE0 != -1)
    swift_once(&qword_1005CECE0, sub_10033A5F8);
  return (_TtC11MobileNotes25NoteDebugStatusController *)(id)qword_100601D48;
}

- (ICNote)currentNote
{
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  _TtC11MobileNotes25NoteDebugStatusController *v6;
  id v8;

  KeyPath = swift_getKeyPath(&unk_100463540, a2);
  v5 = swift_getKeyPath(&unk_100463568, v4);
  v6 = self;
  static Published.subscript.getter(&v8);

  swift_release(KeyPath);
  swift_release(v5);
  return (ICNote *)v8;
}

- (void)setCurrentNote:(id)a3
{
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  KeyPath = swift_getKeyPath(&unk_100463540, a2);
  v7 = swift_getKeyPath(&unk_100463568, v6);
  v9 = a3;
  v8 = a3;
  static Published.subscript.setter(&v9, self, KeyPath, v7);
}

- (_TtC11MobileNotes25NoteDebugStatusController)init
{
  return (_TtC11MobileNotes25NoteDebugStatusController *)sub_10033A840();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC11MobileNotes25NoteDebugStatusController__currentNote;
  v3 = sub_100012E18(&qword_1005D9958);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end

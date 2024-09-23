@implementation ICNoteEditorBaseViewController

- (ICRealtimeCollaborationController)realtimeCollaborationController
{
  uint64_t v2;
  ICNoteEditorBaseViewController *v3;
  void *v4;

  v2 = qword_1005CEBD8;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_1005CEBD8, sub_10029384C);
  if (byte_100601AB8 == 1 && (sub_1002B50FC() & 1) != 0)
  {
    v4 = (void *)sub_1002B2FC0();

  }
  else
  {

    v4 = 0;
  }
  return (ICRealtimeCollaborationController *)v4;
}

@end

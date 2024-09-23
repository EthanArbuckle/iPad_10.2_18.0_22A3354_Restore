@implementation ICGroupActivityDebugStatusController

+ (ICGroupActivityDebugStatusController)sharedController
{
  if (qword_1005CEDA0 != -1)
    swift_once(&qword_1005CEDA0, sub_1003AC1F8);
  return (ICGroupActivityDebugStatusController *)(id)qword_100601F10;
}

+ (void)setUp
{
  if (qword_1005CEDA0 != -1)
    swift_once(&qword_1005CEDA0, sub_1003AC1F8);
}

- (ICGroupActivityDebugStatusController)init
{
  ICGroupActivityDebugStatusController *result;

  result = (ICGroupActivityDebugStatusController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.GroupActivityDebugStatusController", 46, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___ICGroupActivityDebugStatusController_observeNotificationsTask));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___ICGroupActivityDebugStatusController_groupActivities));
  v3 = (char *)self + OBJC_IVAR___ICGroupActivityDebugStatusController__states;
  v4 = sub_100012E18(&qword_1005DBB68);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end

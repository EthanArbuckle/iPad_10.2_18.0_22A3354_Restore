@implementation DPDBackgroundTaskManager

+ (id)sharedInstance
{
  if (qword_100010978 != -1)
    swift_once(&qword_100010978, sub_10000809C);
  return (id)qword_100010DF0;
}

- (DPDBackgroundTaskManager)init
{
  return (DPDBackgroundTaskManager *)sub_100008108();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->postInstallTaskIdentifier[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier], a2);
}

@end

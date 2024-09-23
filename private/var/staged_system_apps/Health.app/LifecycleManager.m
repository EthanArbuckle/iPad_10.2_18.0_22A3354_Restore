@implementation LifecycleManager

- (void)applicationDidEnterBackgroundWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = qword_1000EC140;
  swift_retain(self);
  if (v9 != -1)
    swift_once(&qword_1000EC140, sub_100014684);
  v10 = sub_10008A150();
  if (objc_msgSend((id)objc_opt_self(_HKBehavior), "isRunningStoreDemoMode"))
    sub_10007FB40();
  swift_release(self);
  swift_release(v10);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end

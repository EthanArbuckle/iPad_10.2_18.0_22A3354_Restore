@implementation LocalNotificationCenterImpl

- (_TtC34SiriCrossDeviceArbitrationFeedback27LocalNotificationCenterImpl)init
{
  LocalNotificationCenterImpl.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34SiriCrossDeviceArbitrationFeedback27LocalNotificationCenterImpl_center));
  sub_246264A84((uint64_t)self + OBJC_IVAR____TtC34SiriCrossDeviceArbitrationFeedback27LocalNotificationCenterImpl_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34SiriCrossDeviceArbitrationFeedback27LocalNotificationCenterImpl_queue));
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC34SiriCrossDeviceArbitrationFeedback27LocalNotificationCenterImpl *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_246279B5C((uint64_t)v9, (uint64_t)v10, (uint64_t)v11, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC34SiriCrossDeviceArbitrationFeedback27LocalNotificationCenterImpl *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  LocalNotificationCenterImpl.userNotificationCenter(_:didReceive:withCompletionHandler:)((uint64_t)v10, (uint64_t)v11, (uint64_t)sub_24627A0BC, v9);

  swift_release();
}

@end

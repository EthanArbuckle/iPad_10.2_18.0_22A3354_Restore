@implementation UserNotificationServiceImpl

- (_TtC34SiriCrossDeviceArbitrationFeedback27UserNotificationServiceImpl)init
{
  UserNotificationServiceImpl.init()();
}

- (void).cxx_destruct
{
  sub_2462650C4((uint64_t)self + OBJC_IVAR____TtC34SiriCrossDeviceArbitrationFeedback27UserNotificationServiceImpl_notificationCenter, &qword_25441E5D8);
  sub_246264A84((uint64_t)self + OBJC_IVAR____TtC34SiriCrossDeviceArbitrationFeedback27UserNotificationServiceImpl_delegate);
  swift_unknownObjectRelease();
  sub_2462650C4((uint64_t)self + OBJC_IVAR____TtC34SiriCrossDeviceArbitrationFeedback27UserNotificationServiceImpl_currentRequest, (uint64_t *)&unk_25441E5F8);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34SiriCrossDeviceArbitrationFeedback27UserNotificationServiceImpl_timer));
}

@end

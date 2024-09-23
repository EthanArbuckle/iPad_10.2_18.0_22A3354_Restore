@implementation EventLoggingXpcSubscriptionClient

- (void)request:(id)a3 withReply:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = a3;
  swift_retain();
  EventLoggingXpcSubscriptionClient.request(_:withReply:)(v7, (uint64_t)sub_21DB50B00, v6);

  swift_release();
  swift_release();
}

@end

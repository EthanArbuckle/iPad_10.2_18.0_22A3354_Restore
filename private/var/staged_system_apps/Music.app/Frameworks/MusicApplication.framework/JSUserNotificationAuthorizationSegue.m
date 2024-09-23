@implementation JSUserNotificationAuthorizationSegue

- (void)handleEngagementRequest:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC11MusicJSCore36JSUserNotificationAuthorizationSegue *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_3AE444(v7, v8, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

@end

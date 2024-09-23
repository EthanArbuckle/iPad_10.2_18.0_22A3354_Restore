@implementation FeedbackDaemon

- (_TtC9feedbackd14FeedbackDaemon)init
{
  return (_TtC9feedbackd14FeedbackDaemon *)sub_10004F760();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC9feedbackd14FeedbackDaemon *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100053FD8(v7);

  return v9 & 1;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC9feedbackd14FeedbackDaemon_connectionDelegates));
}

@end

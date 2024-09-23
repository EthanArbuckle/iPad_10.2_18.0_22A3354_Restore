@implementation SiriMailScene

- (UIWindow)window
{
  _TtC10MobileMail13SiriMailScene *v2;
  id v5;

  v2 = self;
  v5 = sub_10036F67C();

  return (UIWindow *)v5;
}

- (void)setWindow:(id)a3
{
  id v4;
  _TtC10MobileMail13SiriMailScene *v5;

  v4 = a3;
  v5 = self;
  sub_10036F72C(a3);

}

- (_TtC10MobileMail13SiriMailScene)init
{
  return (_TtC10MobileMail13SiriMailScene *)sub_10036F7F8();
}

- (void).cxx_destruct
{
  sub_1001F20D8((id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10MobileMail13SiriMailScene_window));
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6;
  id v7;
  id v8;
  _TtC10MobileMail13SiriMailScene *v9;

  v6 = a3;
  v7 = a4;
  v8 = a5;
  v9 = self;
  sub_10036F930(a3, (uint64_t)a4, (uint64_t)a5);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC10MobileMail13SiriMailScene *v5;

  v4 = a3;
  v5 = self;
  sub_100370010((uint64_t)a3);

}

@end

@implementation MCCAgentConnectionManager

- (NSXPCListener)secretAgentServiceListener
{
  return (NSXPCListener *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR____TtC15icloudmailagent25MCCAgentConnectionManager_secretAgentServiceListener));
}

- (void)setSecretAgentServiceListener:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15icloudmailagent25MCCAgentConnectionManager_secretAgentServiceListener);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC15icloudmailagent25MCCAgentConnectionManager_secretAgentServiceListener) = (Class)a3;
  v3 = a3;

}

+ (_TtC15icloudmailagent25MCCAgentConnectionManager)sharedInstance
{
  if (qword_10003AA10 != -1)
    swift_once(&qword_10003AA10, sub_100029758);
  return (_TtC15icloudmailagent25MCCAgentConnectionManager *)(id)qword_10003B350;
}

- (_TtC15icloudmailagent25MCCAgentConnectionManager)init
{
  return (_TtC15icloudmailagent25MCCAgentConnectionManager *)sub_1000297C4();
}

- (void)dealloc
{
  _TtC15icloudmailagent25MCCAgentConnectionManager *v2;

  v2 = self;
  sub_1000298AC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15icloudmailagent25MCCAgentConnectionManager_secretAgentServiceListener));
}

- (void)start
{
  _TtC15icloudmailagent25MCCAgentConnectionManager *v2;

  v2 = self;
  sub_100029968();

}

- (void)startForTesting
{
  _TtC15icloudmailagent25MCCAgentConnectionManager *v2;

  v2 = self;
  sub_100029968();

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC15icloudmailagent25MCCAgentConnectionManager *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100029BDC(v6, v7);

  return v9 & 1;
}

@end

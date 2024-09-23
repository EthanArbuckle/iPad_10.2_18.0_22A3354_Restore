@implementation KCSharingMessagingdXPCListenerDelegate

- (_TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate)init
{
  sub_1000137E0();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10001469C(v7);

  return v9 & 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_listener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_connectionQueue));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_clientConnections));
}

@end

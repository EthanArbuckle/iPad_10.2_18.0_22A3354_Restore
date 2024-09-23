@implementation ConcreteAXUIClient

- (_TtC16ScreenSharingKit18ConcreteAXUIClient)init
{
  _QWORD *v3;
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit18ConcreteAXUIClient_serviceName);
  *v3 = 0xD000000000000020;
  v3[1] = 0x8000000245969190;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit18ConcreteAXUIClient_screenSharingClient) = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit18ConcreteAXUIClient_interruptionHandler);
  v5 = (objc_class *)type metadata accessor for ConcreteAXUIClient();
  *v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return -[ConcreteAXUIClient init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16ScreenSharingKit18ConcreteAXUIClient_screenSharingClient));
  sub_2458723BC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16ScreenSharingKit18ConcreteAXUIClient_interruptionHandler));
}

- (id)userInterfaceClient:(id)a3 accessQueueForProcessingMessageWithIdentifier:(int64_t)a4
{
  return objc_msgSend((id)objc_opt_self(), sel_mainAccessQueue);
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  id v5;
  _TtC16ScreenSharingKit18ConcreteAXUIClient *v6;

  v5 = a3;
  v6 = self;
  sub_245902274((uint64_t)a3);

}

@end

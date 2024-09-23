@implementation KCSharingMessagingdInvitationManagerDelegate

- (_TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate)init
{
  sub_100003F38();
}

- (void)manager:(id)a3 incomingInvitation:(id)a4
{
  id v6;
  _TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_100011990(v6);

}

- (void)manager:(id)a3 senderDidCancelInvitation:(id)a4
{
  id v6;
  id v7;
  _TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100011D0C(v7);

}

- (void)manager:(id)a3 receiverDidAcceptInvitation:(id)a4
{
  id v6;
  id v7;
  _TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100011EBC(v7, "receiver did accept invite %@");

}

- (void)manager:(id)a3 receiverDidDeclineInvitation:(id)a4
{
  id v6;
  id v7;
  _TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100011EBC(v7, "receiver did decline invite %@");

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_daemonConnection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_queue));
  swift_bridgeObjectRelease(*(_QWORD *)&self->manager[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_schemaIdentifier]);
}

@end

@implementation KCSharingMessagingdXPCServer

- (_TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer)init
{
  _TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer *result;

  result = (_TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x616C696176616E75, 0xEB00000000656C62, "keychainsharingmessagingd/KCSharingMessagingdXPCServer.swift", 60, 2, 10, 0);
  __break(1u);
  return result;
}

- (NSString)description
{
  _TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100001E70();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (void)sendNewInvitesForGroup:(KCSharingGroup *)a3 completion:(id)a4
{
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  KCSharingGroup *v14;
  _TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer *v15;
  uint64_t v16;
  uint64_t v17;

  sub_1000032A0(&qword_1000215A0);
  __chkstk_darwin();
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (_QWORD *)swift_allocObject(&unk_10001CC28, 40, 7);
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject(&unk_10001CC50, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100021670;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject(&unk_10001CC78, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100021678;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  v16 = sub_10000351C((uint64_t)v8, (uint64_t)&unk_100021680, (uint64_t)v13);
  swift_release(v16);
}

- (void)cancelPendingInvitesForGroup:(KCSharingGroup *)a3 participantHandles:(NSArray *)a4 completion:(id)a5
{
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  KCSharingGroup *v16;
  NSArray *v17;
  _TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer *v18;
  uint64_t v19;
  uint64_t v20;

  sub_1000032A0(&qword_1000215A0);
  __chkstk_darwin();
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = (_QWORD *)swift_allocObject(&unk_10001CBB0, 48, 7);
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  v13 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject(&unk_10001CBD8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100021650;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject(&unk_10001CC00, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100021658;
  v15[5] = v14;
  v16 = a3;
  v17 = a4;
  v18 = self;
  v19 = sub_10000351C((uint64_t)v10, (uint64_t)&unk_100021660, (uint64_t)v15);
  swift_release(v19);
}

- (void)didAcceptInviteForGroupID:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  NSString *v14;
  _TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer *v15;
  uint64_t v16;
  uint64_t v17;

  sub_1000032A0(&qword_1000215A0);
  __chkstk_darwin();
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (_QWORD *)swift_allocObject(&unk_10001CB38, 40, 7);
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject(&unk_10001CB60, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100021630;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject(&unk_10001CB88, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100021638;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  v16 = sub_10000351C((uint64_t)v8, (uint64_t)&unk_100021640, (uint64_t)v13);
  swift_release(v16);
}

- (void)didDeclineInviteForGroupID:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  NSString *v14;
  _TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer *v15;
  uint64_t v16;
  uint64_t v17;

  sub_1000032A0(&qword_1000215A0);
  __chkstk_darwin();
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (_QWORD *)swift_allocObject(&unk_10001CAC0, 40, 7);
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject(&unk_10001CAE8, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100021610;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject(&unk_10001CB10, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100021618;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  v16 = sub_10000351C((uint64_t)v8, (uint64_t)&unk_100021620, (uint64_t)v13);
  swift_release(v16);
}

- (void)fetchReceivedInviteWithGroupID:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = sub_1000032A0(&qword_1000215A0);
  __chkstk_darwin(v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  v14 = swift_allocObject(&unk_10001CA48, 24, 7);
  *(_QWORD *)(v14 + 16) = v10;
  v15 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v9, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject(&unk_10001CA70, 72, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = self;
  v16[5] = v11;
  v16[6] = v13;
  v16[7] = sub_100003844;
  v16[8] = v14;
  v17 = self;
  swift_bridgeObjectRetain(v13);
  swift_retain(v14);
  v18 = sub_100002C20((uint64_t)v9, (uint64_t)&unk_1000215F8, (uint64_t)v16);

  swift_bridgeObjectRelease(v13);
  swift_release(v14);
  swift_release(v18);
}

- (void)fetchReceivedInvitesWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_1000032A0(&qword_1000215A0);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_10001C9A8, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_10001C9D0, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1000215B0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_10001C9F8, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1000215C0;
  v12[5] = v11;
  v13 = self;
  v14 = sub_10000351C((uint64_t)v7, (uint64_t)&unk_1000215D0, (uint64_t)v12);
  swift_release(v14);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer_connection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer_invitationManagerDelegate));
}

@end

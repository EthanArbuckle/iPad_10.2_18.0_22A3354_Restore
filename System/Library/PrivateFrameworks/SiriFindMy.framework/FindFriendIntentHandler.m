@implementation FindFriendIntentHandler

- (void)resolveFriendForFindFriend:(id)a3 withCompletion:(id)a4
{
  sub_1CCC07C88(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1CCC056A4);
}

- (void)confirmFindFriend:(id)a3 completion:(id)a4
{
  sub_1CCC07C88(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1CCC05EE0);
}

- (void)handleFindFriend:(id)a3 completion:(id)a4
{
  sub_1CCC07C88(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1CCC05F80);
}

- (_TtC10SiriFindMy23FindFriendIntentHandler)init
{
  FindFriendIntentHandler.init()();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10SiriFindMy23FindFriendIntentHandler_deviceState);
  sub_1CCBC3714((uint64_t)self + OBJC_IVAR____TtC10SiriFindMy23FindFriendIntentHandler_sessionManager, (uint64_t (*)(_QWORD))type metadata accessor for FindFriendSessionManager);
  swift_release();
}

@end

@implementation SetGeoFenceIntentHandler

- (void)resolveFriendForSetGeoFence:(id)a3 withCompletion:(id)a4
{
  sub_1CCBC0EE4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1CCBBE3E8);
}

- (void)resolveLocationForSetGeoFence:(id)a3 withCompletion:(id)a4
{
  sub_1CCBC0EE4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1CCBBEE64);
}

- (void)confirmSetGeoFence:(id)a3 completion:(id)a4
{
  sub_1CCBC0EE4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1CCBC0470);
}

- (void)handleSetGeoFence:(id)a3 completion:(id)a4
{
  sub_1CCBC0EE4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1CCBC0848);
}

- (_TtC10SiriFindMy24SetGeoFenceIntentHandler)init
{
  SetGeoFenceIntentHandler.init()();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10SiriFindMy24SetGeoFenceIntentHandler_deviceState);
  sub_1CCBC1B7C((uint64_t)self + OBJC_IVAR____TtC10SiriFindMy24SetGeoFenceIntentHandler_sessionManager, (uint64_t (*)(_QWORD))type metadata accessor for FindFriendSessionManager);
}

@end

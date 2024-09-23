@implementation SetSharedLocationVisibilityIntentHandler

- (void)confirmSetSharedLocationVisibility:(id)a3 completion:(id)a4
{
  sub_1CCC07C88(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1CCCAC634);
}

- (void)handleSetSharedLocationVisibility:(id)a3 completion:(id)a4
{
  sub_1CCC07C88(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1CCCAC6E0);
}

- (_TtC10SiriFindMy40SetSharedLocationVisibilityIntentHandler)init
{
  SetSharedLocationVisibilityIntentHandler.init()();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10SiriFindMy40SetSharedLocationVisibilityIntentHandler_deviceState);
  sub_1CCC365F4((uint64_t)self + OBJC_IVAR____TtC10SiriFindMy40SetSharedLocationVisibilityIntentHandler_sessionManager);
}

@end

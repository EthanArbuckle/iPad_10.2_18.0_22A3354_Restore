@implementation MultiUserStartWorkoutInterceptor

- (_TtC9SeymourUI32MultiUserStartWorkoutInterceptor)init
{
  _TtC9SeymourUI32MultiUserStartWorkoutInterceptor *result;

  result = (_TtC9SeymourUI32MultiUserStartWorkoutInterceptor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9SeymourUI32MultiUserStartWorkoutInterceptor_dynamicOfferCoordinator));
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI32MultiUserStartWorkoutInterceptor_multiUserClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI32MultiUserStartWorkoutInterceptor_serviceSubscriptionCache);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI32MultiUserStartWorkoutInterceptor_sessionClient);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9SeymourUI32MultiUserStartWorkoutInterceptor_webUserInterfaceCoordinator));
  sub_22B119E2C((uint64_t)self + OBJC_IVAR____TtC9SeymourUI32MultiUserStartWorkoutInterceptor_state, type metadata accessor for MultiUserStartWorkoutInterceptor.State);
}

- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC9SeymourUI32MultiUserStartWorkoutInterceptor *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_22B6C3890(a5);

}

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC9SeymourUI32MultiUserStartWorkoutInterceptor *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  MultiUserStartWorkoutInterceptor.dynamicViewController(_:didFinishPurchaseWith:error:)(v8, a4, a5);

}

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  sub_22B393320(self, (int)a2, a3, a4, a5, (void (*)(id, id, void *))sub_22B6C8B10);
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  void *v5;

  v5 = _Block_copy(a5);
  _Block_release(v5);
  return 0;
}

- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  sub_22B393320(self, (int)a2, a3, a4, a5, (void (*)(id, id, void *))sub_22B6C8DB0);
}

@end

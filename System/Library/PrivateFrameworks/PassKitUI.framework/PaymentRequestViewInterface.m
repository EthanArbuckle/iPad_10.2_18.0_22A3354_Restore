@implementation PaymentRequestViewInterface

- (UIViewController)viewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC9PassKitUI27PaymentRequestViewInterface_viewController));
}

- (id)serviceDelegate
{
  swift_beginAccess();
  return (id)swift_unknownObjectRetain();
}

- (void)setServiceDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI27PaymentRequestViewInterface_serviceDelegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)start
{
  sub_19D1C7034((char *)self, (uint64_t)a2, MEMORY[0x1E0D6C7B0]);
}

- (void)stop
{
  sub_19D1C7034((char *)self, (uint64_t)a2, (void (*)(uint64_t, uint64_t))MEMORY[0x1E0D6C7A0]);
}

- (void)invalidate
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  _TtC9PassKitUI27PaymentRequestViewInterface *v7;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI27PaymentRequestViewInterface_stateMachine);
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 32);
  v7 = self;
  v6(v4, v5);

}

- (_TtC9PassKitUI27PaymentRequestViewInterface)init
{
  _TtC9PassKitUI27PaymentRequestViewInterface *result;

  result = (_TtC9PassKitUI27PaymentRequestViewInterface *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI27PaymentRequestViewInterface_presenter);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9PassKitUI27PaymentRequestViewInterface_stateMachine);
  swift_release();
}

@end

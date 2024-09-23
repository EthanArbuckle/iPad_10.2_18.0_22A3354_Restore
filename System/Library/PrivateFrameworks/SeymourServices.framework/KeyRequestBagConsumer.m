@implementation KeyRequestBagConsumer

- (_TtC15SeymourServices21KeyRequestBagConsumer)init
{
  _TtC15SeymourServices21KeyRequestBagConsumer *result;

  result = (_TtC15SeymourServices21KeyRequestBagConsumer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices21KeyRequestBagConsumer_accountProvider);
  swift_release();

}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _TtC15SeymourServices21KeyRequestBagConsumer *v15;

  v10 = _Block_copy(a6);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_1CEBACCAC(v14, (uint64_t)sub_1CEBACCA4, v11);

  swift_release();
}

@end

@implementation DigitalPresentmentAuthorizationCoordinatorPrivateDelegate

- (void)paymentAuthorizationCoordinator:(id)a3 willFinishWithError:(id)a4
{
  id v7;
  _TtC8coreidvd57DigitalPresentmentAuthorizationCoordinatorPrivateDelegate *v8;
  id v9;

  v7 = a3;
  v8 = self;
  v9 = a4;
  sub_1000C60A4(a3, (uint64_t)a4);

}

- (void)paymentAuthorizationCoordinator:(PKPaymentAuthorizationCoordinator *)a3 didAuthorizeContextWithHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  PKPaymentAuthorizationCoordinator *v15;
  _TtC8coreidvd57DigitalPresentmentAuthorizationCoordinatorPrivateDelegate *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_1006076F8, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100607720, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100633620;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100607748, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100634BB0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_1004B685C((uint64_t)v9, (uint64_t)&unk_100631240, (uint64_t)v14);
  swift_release(v17);
}

- (_TtC8coreidvd57DigitalPresentmentAuthorizationCoordinatorPrivateDelegate)init
{
  _TtC8coreidvd57DigitalPresentmentAuthorizationCoordinatorPrivateDelegate *result;

  result = (_TtC8coreidvd57DigitalPresentmentAuthorizationCoordinatorPrivateDelegate *)_swift_stdlib_reportUnimplementedInitializer("coreidvd.DigitalPresentmentAuthorizationCoordinatorPrivateDelegate", 66, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8coreidvd57DigitalPresentmentAuthorizationCoordinatorPrivateDelegate_promise));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8coreidvd57DigitalPresentmentAuthorizationCoordinatorPrivateDelegate_responseBuilder));
  sub_1000C7A08(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtC8coreidvd57DigitalPresentmentAuthorizationCoordinatorPrivateDelegate_result), self->promise[OBJC_IVAR____TtC8coreidvd57DigitalPresentmentAuthorizationCoordinatorPrivateDelegate_result]);
  sub_100008030((uint64_t)self+ OBJC_IVAR____TtC8coreidvd57DigitalPresentmentAuthorizationCoordinatorPrivateDelegate_postAuthorizationSignpost, (uint64_t *)&unk_1006335F0);
}

@end

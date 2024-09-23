@implementation StreamingKeyProvisioner

- (void)dealloc
{
  _TtC12SeymourMedia23StreamingKeyProvisioner *v2;

  v2 = self;
  sub_21A17EF00();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia23StreamingKeyProvisioner_analyticsReporter);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia23StreamingKeyProvisioner_assetClient);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia23StreamingKeyProvisioner_backoffIntervalProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia23StreamingKeyProvisioner_keyDeliveryClient);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12SeymourMedia23StreamingKeyProvisioner_contentKeySession));
  sub_21A18379C((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia23StreamingKeyProvisioner_state);
  sub_21A0E0118(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12SeymourMedia23StreamingKeyProvisioner_onUnrecoverableError));
}

- (_TtC12SeymourMedia23StreamingKeyProvisioner)init
{
  _TtC12SeymourMedia23StreamingKeyProvisioner *result;

  result = (_TtC12SeymourMedia23StreamingKeyProvisioner *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4
{
  id v6;
  id v7;
  _TtC12SeymourMedia23StreamingKeyProvisioner *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_21A180EE8((uint64_t)v6, v7);

}

- (void)contentKeySession:(id)a3 didProvidePersistableContentKeyRequest:(id)a4
{
  id v6;
  id v7;
  _TtC12SeymourMedia23StreamingKeyProvisioner *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_21A1856C0(v7);

}

- (void)contentKeySession:(id)a3 didProvideRenewingContentKeyRequest:(id)a4
{
  id v6;
  id v7;
  _TtC12SeymourMedia23StreamingKeyProvisioner *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_21A1820D8((void (*)(_QWORD, _QWORD, _QWORD))v6, v7);

}

- (void)contentKeySession:(id)a3 contentKeyRequest:(id)a4 didFailWithError:(id)a5
{
  id v8;
  id v9;
  _TtC12SeymourMedia23StreamingKeyProvisioner *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  v10 = self;
  sub_21A185FE0(v9, v11);

}

- (void)contentKeySession:(id)a3 contentKeyRequestDidSucceed:(id)a4
{
  id v6;
  id v7;
  _TtC12SeymourMedia23StreamingKeyProvisioner *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_21A1865C4(v7);

}

- (BOOL)contentKeySession:(id)a3 shouldRetryContentKeyRequest:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC12SeymourMedia23StreamingKeyProvisioner *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  LOBYTE(self) = sub_21A1867CC(v9, v10);

  return self & 1;
}

@end

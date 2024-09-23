@implementation PASUISignInViewModel

- (NSAttributedString)attributedTitle
{
  _TtC23ProximityAppleIDSetupUI20PASUISignInViewModel *v2;
  id v3;

  v2 = self;
  v3 = sub_220D83FF0();

  return (NSAttributedString *)v3;
}

- (NSAttributedString)attributedMessage
{
  _TtC23ProximityAppleIDSetupUI20PASUISignInViewModel *v2;
  id v3;

  v2 = self;
  v3 = sub_220D842E8();

  return (NSAttributedString *)v3;
}

- (UIImage)headerImage
{
  return (UIImage *)sub_220D85964();
}

- (_TtC23ProximityAppleIDSetupUI20PASUISignInViewModel)init
{
  _TtC23ProximityAppleIDSetupUI20PASUISignInViewModel *result;

  result = (_TtC23ProximityAppleIDSetupUI20PASUISignInViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel_contextProvider);
  swift_release();
  sub_220D5CDB4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel_continueSignInAction));
}

- (void)signInViewController:(id)a3 didCompleteWithAuthenticationResults:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC23ProximityAppleIDSetupUI20PASUISignInViewModel *v8;

  v6 = sub_220D99304();
  v7 = a3;
  v8 = self;
  sub_220D85E20(v6);

  swift_bridgeObjectRelease();
}

- (void)willAuthenticateWithContext:(id)a3
{
  id v4;
  _TtC23ProximityAppleIDSetupUI20PASUISignInViewModel *v5;

  v4 = a3;
  v5 = self;
  _s23ProximityAppleIDSetupUI20PASUISignInViewModelC27willAuthenticateWithContextyySo023AKAppleIDAuthenticationL0CF_0(v4);

}

- (id)authenticationContext
{
  _TtC23ProximityAppleIDSetupUI20PASUISignInViewModel *v2;
  id v3;

  v2 = self;
  v3 = PASUISignInViewModel.authenticationContext()();

  return v3;
}

@end

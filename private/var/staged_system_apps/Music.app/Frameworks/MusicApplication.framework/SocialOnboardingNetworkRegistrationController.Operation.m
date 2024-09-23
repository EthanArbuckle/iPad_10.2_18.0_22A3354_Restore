@implementation SocialOnboardingNetworkRegistrationController.Operation

- (void)execute
{
  _TtCC16MusicApplication45SocialOnboardingNetworkRegistrationControllerP33_A38BE87C3BD3A87290E3ECE22270D9819Operation *v2;

  v2 = self;
  sub_231A14();

}

- (void)finishWithError:(id)a3
{
  _BOOL8 v4;
  void (*v5)(_BOOL8, id);
  _TtCC16MusicApplication45SocialOnboardingNetworkRegistrationControllerP33_A38BE87C3BD3A87290E3ECE22270D9819Operation *v6;
  id v7;
  void *v8;
  objc_super v9;

  v4 = a3 == 0;
  v5 = *(void (**)(_BOOL8, id))&self->responseHandler[OBJC_IVAR____TtCC16MusicApplication45SocialOnboardingNetworkRegistrationControllerP33_A38BE87C3BD3A87290E3ECE22270D9819Operation_responseHandler];
  v6 = self;
  v7 = a3;
  v5(v4, a3);
  if (a3)
    v8 = (void *)_convertErrorToNSError(_:)(v7);
  else
    v8 = 0;
  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for SocialOnboardingNetworkRegistrationController.Operation(0);
  -[SocialOnboardingNetworkRegistrationController.Operation finishWithError:](&v9, "finishWithError:", v8);

}

- (_TtCC16MusicApplication45SocialOnboardingNetworkRegistrationControllerP33_A38BE87C3BD3A87290E3ECE22270D9819Operation)init
{
  _TtCC16MusicApplication45SocialOnboardingNetworkRegistrationControllerP33_A38BE87C3BD3A87290E3ECE22270D9819Operation *result;

  result = (_TtCC16MusicApplication45SocialOnboardingNetworkRegistrationControllerP33_A38BE87C3BD3A87290E3ECE22270D9819Operation *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.Operation", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  uint64_t v4;

  v3 = &self->responseHandler[OBJC_IVAR____TtCC16MusicApplication45SocialOnboardingNetworkRegistrationControllerP33_A38BE87C3BD3A87290E3ECE22270D9819Operation_registrationURL];
  v4 = type metadata accessor for URL(0);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(_QWORD *)&self->responseHandler[OBJC_IVAR____TtCC16MusicApplication45SocialOnboardingNetworkRegistrationControllerP33_A38BE87C3BD3A87290E3ECE22270D9819Operation_responseHandler
                                                + 8]);
}

@end

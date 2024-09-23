@implementation AuthenticateExtras

- (void)fetchExtrasWithCompletion:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  void (*v6)(_QWORD *, uint64_t, _QWORD);
  _TtC21ProximityAppleIDSetupP33_6B22B88DD3ECBED0D0354FC242B14C8118AuthenticateExtras *v7;

  v4 = _Block_copy(a3);
  v5 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC21ProximityAppleIDSetupP33_6B22B88DD3ECBED0D0354FC242B14C8118AuthenticateExtras_anisetteDataProvider);
  v6 = (void (*)(_QWORD *, uint64_t, _QWORD))v4[2];
  v7 = self;
  v6(v4, v5, 0);
  _Block_release(v4);

}

- (_TtC21ProximityAppleIDSetupP33_6B22B88DD3ECBED0D0354FC242B14C8118AuthenticateExtras)init
{
  _TtC21ProximityAppleIDSetupP33_6B22B88DD3ECBED0D0354FC242B14C8118AuthenticateExtras *result;

  result = (_TtC21ProximityAppleIDSetupP33_6B22B88DD3ECBED0D0354FC242B14C8118AuthenticateExtras *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
